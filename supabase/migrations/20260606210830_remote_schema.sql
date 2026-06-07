


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE EXTENSION IF NOT EXISTS "pg_cron" WITH SCHEMA "pg_catalog";






CREATE EXTENSION IF NOT EXISTS "pg_net" WITH SCHEMA "extensions";








ALTER SCHEMA "public" OWNER TO "postgres";


CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "postgis" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";






CREATE TYPE "public"."incident_severity" AS ENUM (
    'low',
    'medium',
    'high'
);


ALTER TYPE "public"."incident_severity" OWNER TO "postgres";


CREATE TYPE "public"."incident_status" AS ENUM (
    'active',
    'resolved',
    'fake'
);


ALTER TYPE "public"."incident_status" OWNER TO "postgres";


CREATE TYPE "public"."incident_type" AS ENUM (
    'traffic',
    'police',
    'crash',
    'hazard',
    'camera',
    'closure',
    'other'
);


ALTER TYPE "public"."incident_type" OWNER TO "postgres";


CREATE TYPE "public"."vote_type" AS ENUM (
    'upvote',
    'downvote'
);


ALTER TYPE "public"."vote_type" OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."cast_vote"("p_incident_id" "text", "p_vote_type" "text") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE
  v_user_id uuid := auth.uid();
  v_incident_uuid uuid := p_incident_id::uuid;
  v_old_vote text;
  v_new_upvotes int;
  v_new_downvotes int;
BEGIN
  IF v_user_id IS NULL THEN RAISE EXCEPTION 'Vui lòng đăng nhập để đánh giá'; END IF;

  SELECT vote INTO v_old_vote FROM incident_votes WHERE incident_id = v_incident_uuid AND user_id = v_user_id;

  -- 1. XỬ LÝ CỘNG/TRỪ VOTE
  IF v_old_vote = p_vote_type THEN
    DELETE FROM incident_votes WHERE incident_id = v_incident_uuid AND user_id = v_user_id;
    IF p_vote_type = 'upvote' THEN
      UPDATE incidents SET upvotes = GREATEST(upvotes - 1, 0) WHERE id = v_incident_uuid;
    ELSE
      UPDATE incidents SET downvotes = GREATEST(downvotes - 1, 0) WHERE id = v_incident_uuid;
    END IF;
  ELSE
    INSERT INTO incident_votes (incident_id, user_id, vote)
    VALUES (v_incident_uuid, v_user_id, p_vote_type::vote_type)
    ON CONFLICT (incident_id, user_id) 
    DO UPDATE SET vote = p_vote_type::vote_type, created_at = now();

    IF p_vote_type = 'upvote' THEN
      UPDATE incidents SET upvotes = upvotes + 1, downvotes = GREATEST(downvotes - (CASE WHEN v_old_vote = 'downvote' THEN 1 ELSE 0 END), 0) WHERE id = v_incident_uuid;
    ELSE
      UPDATE incidents SET downvotes = downvotes + 1, upvotes = GREATEST(upvotes - (CASE WHEN v_old_vote = 'upvote' THEN 1 ELSE 0 END), 0) WHERE id = v_incident_uuid;
    END IF;
  END IF;

  -- =========================================================================
  -- 2. LOGIC TỰ ĐỘNG ĐÁNH GIÁ SỰ CỐ FAKE (MỚI THÊM)
  -- =========================================================================
  -- Lấy số lượng vote mới nhất
  SELECT upvotes, downvotes INTO v_new_upvotes, v_new_downvotes FROM incidents WHERE id = v_incident_uuid;

  -- KIỂM TRA ĐIỀU KIỆN FAKE: Nếu downvote >= 3 VÀ downvote lớn hơn gấp đôi upvote
  IF v_new_downvotes >= 3 AND v_new_downvotes > (v_new_upvotes * 2) THEN
    UPDATE incidents SET status = 'fake', updated_at = now() WHERE id = v_incident_uuid AND status = 'active';
  
  -- KIỂM TRA PHỤC HỒI: Nếu được upvote lại và không còn thỏa mãn điều kiện fake
  ELSIF v_new_downvotes < 3 OR v_new_downvotes <= (v_new_upvotes * 2) THEN
    UPDATE incidents SET status = 'active', updated_at = now() WHERE id = v_incident_uuid AND status = 'fake';
  END IF;

END;
$$;


ALTER FUNCTION "public"."cast_vote"("p_incident_id" "text", "p_vote_type" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_nearby_devices_for_push"("incident_lat" double precision, "incident_lng" double precision, "radius_meters" integer DEFAULT 3000) RETURNS TABLE("device_id" "text", "fcm_token" "text", "user_id" "uuid")
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
BEGIN
  RETURN QUERY
  SELECT 
      ud.device_id,
      ud.fcm_token,
      u.id as user_id
  FROM user_devices ud
  JOIN users u ON u.id = ud.user_id
  WHERE u.is_push_enabled = true 
    AND u.do_not_disturb = false
    -- KIỂM TRA KHOẢNG CÁCH BẰNG POSTGIS (Siêu nhanh)
    -- Hàm ST_DWithin tính toán khoảng cách trên bề mặt quả địa cầu (meters)
    -- Cần phải ép kiểu lat/lng tạm thời của sự cố thành PostGIS Geography
    AND ST_DWithin(
        (SELECT location FROM incidents ORDER BY created_at DESC LIMIT 1), -- Lấy location của incident vừa tạo (hoặc truyền id vào)
        ST_SetSRID(ST_MakePoint(incident_lng, incident_lat), 4326)::geography, 
        radius_meters
    );
END;
$$;


ALTER FUNCTION "public"."get_nearby_devices_for_push"("incident_lat" double precision, "incident_lng" double precision, "radius_meters" integer) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_user_analytics"("p_user_id" "uuid", "p_time_range" "text") RETURNS json
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE
  v_curr_start timestamptz;
  v_prev_start timestamptz;
  
  v_curr_reports int;
  v_prev_reports int;
  v_reports_percent float;
  v_reports_direction text;
  
  v_curr_upvotes int;
  v_prev_upvotes int;
  v_upvotes_percent float;
  v_upvotes_direction text;

  v_curr_downvotes int;
  v_conf_rate float;
  
  v_reputation int;
  v_dist_total int;
  v_distribution json;
  v_recent_activities json;
BEGIN
  -- 1. XÁC ĐỊNH MỐC THỜI GIAN
  IF p_time_range = 'week' THEN
    v_curr_start := date_trunc('week', now());
    v_prev_start := v_curr_start - interval '1 week';
  ELSIF p_time_range = 'month' THEN
    v_curr_start := date_trunc('month', now());
    v_prev_start := v_curr_start - interval '1 month';
  ELSE
    v_curr_start := date_trunc('year', now());
    v_prev_start := v_curr_start - interval '1 year';
  END IF;

  SELECT reputation_score INTO v_reputation FROM users WHERE id = p_user_id;

  -- ==========================================
  -- 2. TÍNH TOÁN BÁO CÁO (REPORTS)
  -- ==========================================
  SELECT count(*) INTO v_curr_reports FROM incidents WHERE reported_by = p_user_id AND created_at >= v_curr_start;
  SELECT count(*) INTO v_prev_reports FROM incidents WHERE reported_by = p_user_id AND created_at >= v_prev_start AND created_at < v_curr_start;
  
  IF v_curr_reports > v_prev_reports THEN
    v_reports_direction := 'up';
    v_reports_percent := CASE WHEN v_prev_reports = 0 THEN 100.0 ELSE round(((v_curr_reports - v_prev_reports)::numeric / v_prev_reports) * 100.0, 1) END;
  ELSIF v_curr_reports < v_prev_reports THEN
    v_reports_direction := 'down';
    v_reports_percent := CASE WHEN v_prev_reports = 0 THEN 100.0 ELSE round((abs(v_curr_reports - v_prev_reports)::numeric / v_prev_reports) * 100.0, 1) END;
  ELSE
    v_reports_direction := 'flat';
    v_reports_percent := 0.0;
  END IF;

  -- ==========================================
  -- 3. TÍNH TOÁN UPVOTE / DOWNVOTE (CHUẨN LOGIC MỚI)
  -- ==========================================
  -- Đếm upvote trong kỳ hiện tại (dựa trên bảng incident_votes)
  SELECT count(*) INTO v_curr_upvotes 
  FROM incident_votes iv JOIN incidents i ON iv.incident_id = i.id 
  WHERE i.reported_by = p_user_id AND iv.vote = 'upvote' AND iv.created_at >= v_curr_start;

  -- Đếm upvote trong kỳ trước
  SELECT count(*) INTO v_prev_upvotes 
  FROM incident_votes iv JOIN incidents i ON iv.incident_id = i.id 
  WHERE i.reported_by = p_user_id AND iv.vote = 'upvote' AND iv.created_at >= v_prev_start AND iv.created_at < v_curr_start;

  -- Xu hướng Upvote
  IF v_curr_upvotes > v_prev_upvotes THEN
    v_upvotes_direction := 'up';
    v_upvotes_percent := CASE WHEN v_prev_upvotes = 0 THEN 100.0 ELSE round(((v_curr_upvotes - v_prev_upvotes)::numeric / v_prev_upvotes) * 100.0, 1) END;
  ELSIF v_curr_upvotes < v_prev_upvotes THEN
    v_upvotes_direction := 'down';
    v_upvotes_percent := CASE WHEN v_prev_upvotes = 0 THEN 100.0 ELSE round((abs(v_curr_upvotes - v_prev_upvotes)::numeric / v_prev_upvotes) * 100.0, 1) END;
  ELSE
    v_upvotes_direction := 'flat';
    v_upvotes_percent := 0.0;
  END IF;

  -- Đếm Downvote kỳ hiện tại để tính Tỷ lệ xác nhận
  SELECT count(*) INTO v_curr_downvotes 
  FROM incident_votes iv JOIN incidents i ON iv.incident_id = i.id 
  WHERE i.reported_by = p_user_id AND iv.vote = 'downvote' AND iv.created_at >= v_curr_start;

  -- Tính Tỷ lệ xác nhận (Xử lý lỗi chia cho 0 bằng NULLIF)
  v_conf_rate := round(COALESCE((v_curr_upvotes::numeric * 100.0) / NULLIF(v_curr_upvotes + v_curr_downvotes, 0), 0.0), 1);

  -- ==========================================
  -- 4. PHÂN BỔ SỰ CỐ & TỔNG
  -- ==========================================
  SELECT COALESCE(sum(count), 0), COALESCE(json_agg(row_to_json(t)), '[]'::json) INTO v_dist_total, v_distribution
  FROM (
    SELECT type, count(*) as count
    FROM incidents WHERE reported_by = p_user_id AND created_at >= v_curr_start GROUP BY type
  ) t;

  -- ==========================================
  -- 5. HOẠT ĐỘNG GẦN ĐÂY (Bỏ hardcode điểm)
  -- ==========================================
  SELECT COALESCE(json_agg(row_to_json(a)), '[]'::json) INTO v_recent_activities
  FROM (
    SELECT id, type as action_type, created_at, severity, upvotes, downvotes, lat, lng,
           -- Tính điểm thưởng cho từng báo cáo
           (10 + CASE severity WHEN 'high' THEN 5 WHEN 'medium' THEN 3 ELSE 1 END + (upvotes * 2)) as earned_points
    FROM incidents
    WHERE reported_by = p_user_id
    ORDER BY created_at DESC
    LIMIT 10
  ) a;

  -- 6. ĐÓNG GÓI JSON
  RETURN json_build_object(
    'reputation_score', COALESCE(v_reputation, 0),
    'total_reports', v_curr_reports,
    'reports_change_percent', v_reports_percent,
    'reports_direction', v_reports_direction,
    'total_upvotes', v_curr_upvotes,
    'upvotes_change_percent', v_upvotes_percent,
    'upvotes_direction', v_upvotes_direction,
    'total_downvotes', v_curr_downvotes,
    'confirmation_rate', v_conf_rate,
    'distribution_total', v_dist_total,
    'distribution', v_distribution,
    'recent_activities', v_recent_activities
  );
END;
$$;


ALTER FUNCTION "public"."get_user_analytics"("p_user_id" "uuid", "p_time_range" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."handle_new_user"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
begin
  insert into public.users (
    id,
    email,
    display_name,
    avatar_url
  )
  values (
    new.id,
    new.email,
    coalesce(
      new.raw_user_meta_data->>'full_name',
      new.raw_user_meta_data->>'name'
    ),
    coalesce(
      new.raw_user_meta_data->>'avatar_url',
      new.raw_user_meta_data->>'picture'
    )
  )
  on conflict (id) do nothing;

  return new;
end;
$$;


ALTER FUNCTION "public"."handle_new_user"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."update_user_reputation"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE
  v_points int := 0;
BEGIN
  -- TRƯỜNG HỢP 1: User tạo báo cáo mới
  IF TG_OP = 'INSERT' THEN
    -- Công thức: 10đ cơ bản + điểm theo mức độ
    v_points := 10 + (CASE NEW.severity WHEN 'high' THEN 5 WHEN 'medium' THEN 3 ELSE 1 END);
    
    UPDATE public.users 
    SET reputation_score = reputation_score + v_points, updated_at = now() 
    WHERE id = NEW.reported_by;
  
  -- TRƯỜNG HỢP 2: Báo cáo được người khác Upvote/Hủy Upvote
  ELSIF TG_OP = 'UPDATE' AND NEW.upvotes IS DISTINCT FROM OLD.upvotes THEN
    -- Lấy số upvote mới trừ upvote cũ nhân 2 (Cộng thêm 2đ nếu tăng, trừ 2đ nếu giảm)
    v_points := (NEW.upvotes - OLD.upvotes) * 2;
    
    UPDATE public.users 
    SET reputation_score = reputation_score + v_points, updated_at = now() 
    WHERE id = NEW.reported_by;
  END IF;

  RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."update_user_reputation"() OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."incident_votes" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "incident_id" "uuid",
    "user_id" "uuid",
    "vote" "public"."vote_type" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."incident_votes" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."incidents" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "arcgis_object_id" "text",
    "type" "public"."incident_type" NOT NULL,
    "severity" "public"."incident_severity" NOT NULL,
    "lat" double precision NOT NULL,
    "lng" double precision NOT NULL,
    "location" "extensions"."geography"(Point,4326) GENERATED ALWAYS AS (("extensions"."st_setsrid"("extensions"."st_makepoint"("lng", "lat"), 4326))::"extensions"."geography") STORED,
    "description" "text",
    "reported_by" "uuid",
    "upvotes" integer DEFAULT 0,
    "downvotes" integer DEFAULT 0,
    "status" "public"."incident_status" DEFAULT 'active'::"public"."incident_status",
    "expires_at" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."incidents" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."notifications" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid",
    "type" "text" NOT NULL,
    "title" "text",
    "body" "text",
    "reference_incident_id" "uuid",
    "is_read" boolean DEFAULT false,
    "created_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."notifications" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."user_devices" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "fcm_token" "text" NOT NULL,
    "device_name" "text",
    "device_type" "text",
    "last_active_at" timestamp with time zone DEFAULT "now"(),
    "created_at" timestamp with time zone DEFAULT "now"(),
    "device_id" "text"
);


ALTER TABLE "public"."user_devices" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."users" (
    "id" "uuid" NOT NULL,
    "email" "text",
    "display_name" "text",
    "avatar_url" "text",
    "reputation_score" integer DEFAULT 0,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "is_push_enabled" boolean DEFAULT true,
    "do_not_disturb" boolean DEFAULT false
);


ALTER TABLE "public"."users" OWNER TO "postgres";


ALTER TABLE ONLY "public"."incident_votes"
    ADD CONSTRAINT "incident_votes_incident_id_user_id_key" UNIQUE ("incident_id", "user_id");



ALTER TABLE ONLY "public"."incident_votes"
    ADD CONSTRAINT "incident_votes_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."incidents"
    ADD CONSTRAINT "incidents_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."notifications"
    ADD CONSTRAINT "notifications_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."user_devices"
    ADD CONSTRAINT "unique_user_device" UNIQUE ("user_id", "device_id");



ALTER TABLE ONLY "public"."user_devices"
    ADD CONSTRAINT "user_devices_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");



CREATE INDEX "idx_incidents_expires_at" ON "public"."incidents" USING "btree" ("expires_at");



CREATE INDEX "idx_incidents_location" ON "public"."incidents" USING "gist" ("location");



CREATE INDEX "idx_incidents_status" ON "public"."incidents" USING "btree" ("status");



CREATE INDEX "idx_incidents_type" ON "public"."incidents" USING "btree" ("type");



CREATE INDEX "idx_notifications_user_id" ON "public"."notifications" USING "btree" ("user_id");



CREATE INDEX "idx_user_devices_fcm_token" ON "public"."user_devices" USING "btree" ("fcm_token");



CREATE INDEX "idx_user_devices_user_id" ON "public"."user_devices" USING "btree" ("user_id");



CREATE UNIQUE INDEX "user_devices_user_device_idx" ON "public"."user_devices" USING "btree" ("user_id", "device_id");



CREATE OR REPLACE TRIGGER "sync_arcgis" AFTER INSERT OR DELETE OR UPDATE ON "public"."incidents" FOR EACH ROW EXECUTE FUNCTION "supabase_functions"."http_request"('https://ysfowqhbbaohkdmvwdja.supabase.co/functions/v1/sync-incident-arcgis', 'POST', '{"Content-type":"application/json","Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlzZm93cWhiYmFvaGtkbXZ3ZGphIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2Mzk5NDYwNywiZXhwIjoyMDc5NTcwNjA3fQ.0uQa9VS_ZlJqLbYJSsykPbimi4SfaPSwNsr1q72qdi4"}', '{}', '5000');



CREATE OR REPLACE TRIGGER "trigger_reputation_update" AFTER INSERT OR UPDATE OF "upvotes" ON "public"."incidents" FOR EACH ROW EXECUTE FUNCTION "public"."update_user_reputation"();



ALTER TABLE ONLY "public"."incident_votes"
    ADD CONSTRAINT "incident_votes_incident_id_fkey" FOREIGN KEY ("incident_id") REFERENCES "public"."incidents"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."incident_votes"
    ADD CONSTRAINT "incident_votes_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."incidents"
    ADD CONSTRAINT "incidents_reported_by_fkey" FOREIGN KEY ("reported_by") REFERENCES "public"."users"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."notifications"
    ADD CONSTRAINT "notifications_reference_incident_id_fkey" FOREIGN KEY ("reference_incident_id") REFERENCES "public"."incidents"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."notifications"
    ADD CONSTRAINT "notifications_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."user_devices"
    ADD CONSTRAINT "user_devices_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_id_fkey" FOREIGN KEY ("id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



CREATE POLICY "Authenticated users can create incidents." ON "public"."incidents" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() = "reported_by"));



CREATE POLICY "Incidents are viewable by everyone." ON "public"."incidents" FOR SELECT USING (true);



CREATE POLICY "Public profiles are viewable by everyone." ON "public"."users" FOR SELECT USING (true);



CREATE POLICY "Users can delete own devices" ON "public"."user_devices" FOR DELETE TO "authenticated" USING (("auth"."uid"() = "user_id"));



CREATE POLICY "Users can delete own incidents." ON "public"."incidents" FOR DELETE TO "authenticated" USING (("auth"."uid"() = "reported_by"));



CREATE POLICY "Users can insert own devices" ON "public"."user_devices" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() = "user_id"));



CREATE POLICY "Users can update own active incidents." ON "public"."incidents" FOR UPDATE TO "authenticated" USING (("auth"."uid"() = "reported_by"));



CREATE POLICY "Users can update own devices" ON "public"."user_devices" FOR UPDATE TO "authenticated" USING (("auth"."uid"() = "user_id"));



CREATE POLICY "Users can update own notifications." ON "public"."notifications" FOR UPDATE TO "authenticated" USING (("auth"."uid"() = "user_id"));



CREATE POLICY "Users can update own profile." ON "public"."users" FOR UPDATE USING (("auth"."uid"() = "id"));



CREATE POLICY "Users can update/delete own vote." ON "public"."incident_votes" TO "authenticated" USING (("auth"."uid"() = "user_id"));



CREATE POLICY "Users can view own devices" ON "public"."user_devices" FOR SELECT TO "authenticated" USING (("auth"."uid"() = "user_id"));



CREATE POLICY "Users can view own notifications." ON "public"."notifications" FOR SELECT TO "authenticated" USING (("auth"."uid"() = "user_id"));



CREATE POLICY "Users can vote." ON "public"."incident_votes" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() = "user_id"));



CREATE POLICY "Votes are viewable by everyone." ON "public"."incident_votes" FOR SELECT USING (true);



ALTER TABLE "public"."incident_votes" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."incidents" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."notifications" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."user_devices" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."users" ENABLE ROW LEVEL SECURITY;




ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";






ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "public"."incidents";



ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "public"."notifications";









REVOKE USAGE ON SCHEMA "public" FROM PUBLIC;
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "service_role";
























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































GRANT ALL ON TABLE "public"."incident_votes" TO "authenticated";
GRANT ALL ON TABLE "public"."incident_votes" TO "anon";
GRANT ALL ON TABLE "public"."incident_votes" TO "service_role";



GRANT ALL ON TABLE "public"."incidents" TO "authenticated";
GRANT ALL ON TABLE "public"."incidents" TO "anon";
GRANT ALL ON TABLE "public"."incidents" TO "service_role";



GRANT ALL ON TABLE "public"."notifications" TO "authenticated";
GRANT ALL ON TABLE "public"."notifications" TO "service_role";



GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "public"."user_devices" TO "authenticated";



GRANT ALL ON TABLE "public"."users" TO "authenticated";
GRANT ALL ON TABLE "public"."users" TO "anon";
GRANT ALL ON TABLE "public"."users" TO "service_role";


































revoke delete on table "public"."notifications" from "anon";

revoke insert on table "public"."notifications" from "anon";

revoke references on table "public"."notifications" from "anon";

revoke select on table "public"."notifications" from "anon";

revoke trigger on table "public"."notifications" from "anon";

revoke truncate on table "public"."notifications" from "anon";

revoke update on table "public"."notifications" from "anon";

revoke delete on table "public"."user_devices" from "anon";

revoke insert on table "public"."user_devices" from "anon";

revoke references on table "public"."user_devices" from "anon";

revoke select on table "public"."user_devices" from "anon";

revoke trigger on table "public"."user_devices" from "anon";

revoke truncate on table "public"."user_devices" from "anon";

revoke update on table "public"."user_devices" from "anon";

revoke references on table "public"."user_devices" from "authenticated";

revoke trigger on table "public"."user_devices" from "authenticated";

revoke truncate on table "public"."user_devices" from "authenticated";

revoke delete on table "public"."user_devices" from "service_role";

revoke insert on table "public"."user_devices" from "service_role";

revoke references on table "public"."user_devices" from "service_role";

revoke select on table "public"."user_devices" from "service_role";

revoke trigger on table "public"."user_devices" from "service_role";

revoke truncate on table "public"."user_devices" from "service_role";

revoke update on table "public"."user_devices" from "service_role";

CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


