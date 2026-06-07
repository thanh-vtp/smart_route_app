import { createClient } from "npm:@supabase/supabase-js@2";
import { JWT } from "npm:google-auth-library@9";
// Deno 2.x / TS 6.x sử dụng cú pháp 'with { type: "json" }' thay cho 'assert'
import serviceAccount from "./service-account.json" with { type: "json" };

// ================= TYPES DEFINITION (TS 6.x Strict Mode) =================
interface IncidentRecord {
  id: string;
  type: string;
  severity: string;
  lat: number;
  lng: number;
  address?: string | null;
  description?: string | null;
  reported_by: string;
  status: string;
}

interface WebhookPayload {
  type: string;
  table: string;
  record: IncidentRecord;
  old_record: IncidentRecord | null;
}

// ================= INIT =================
const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
const supabaseKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
const supabase = createClient(supabaseUrl, supabaseKey);

// ================= MAIN SERVER (Deno 2.x Native) =================
Deno.serve(async (req: Request) => {
  try {
    // Chỉ parse JSON nếu là POST request
    if (req.method !== "POST") {
      console.warn("[TỪ CHỐI] Method không hợp lệ:", req.method);
      return response({ error: "Method not allowed" }, 405);
    }

    const payload = await req.json() as WebhookPayload;

    console.log(
      `[WEBHOOK ĐÃ KÍCH HOẠT] Bảng: ${payload.table}, Hành động: ${payload.type}`,
    );

    // 1. Chỉ xử lý khi có dòng MỚI được INSERT vào bảng incidents
    if (payload.table !== "incidents" || payload.type !== "INSERT") {
      console.log(
        `[BỎ QUA] Chỉ xử lý INSERT cho bảng incidents. Đang thoát...`,
      );

      return response({
        message: "Ignored: Not an INSERT event on incidents table",
      });
    }

    const incident = payload.record;
    const reporterUid = incident.reported_by;

    // 2. Build Nội dung thông báo
    const { title, body } = buildNotificationContent(incident);

    console.log(
      `[TÌM NGƯỜI NHẬN] Đang tìm các user khác ngoài người báo cáo (${reporterUid})...`,
    );

    // 3. Lấy danh sách người nhận thông báo
    const recipients = await getRecipients(reporterUid);
    if (recipients.length === 0) {
      console.warn(
        `[DỪNG LẠI] Không tìm thấy user nào khác có fcm_token hợp lệ để gửi Push! Đang thoát...`,
      );

      return response({ message: "No recipients found" });
    }

    // Lọc danh sách FCM token hợp lệ
    const tokens = recipients.map((u) => u.fcm_token).filter((t) =>
      t && t.trim().length > 0
    );

    // Lọc danh sách User ID không trùng lặp (Set giúp loại bỏ phần tử trùng)
    const uniqueUserIds = [...new Set(recipients.map((u) => u.id))];

    console.log(
      `[TIẾN HÀNH GỬI] Tìm thấy ${tokens.length} token hợp lệ. Đang bắt đầu bắn Push FCM...`,
    );

    // 4. Lấy Google Access Token cho API FCM v1
    const accessToken = await getAccessToken();

    // 5. Chạy SONG SONG 2 tác vụ: Bắn Push FCM và Lưu DB
    await Promise.all([
      sendPushToMultiple(
        tokens,
        title,
        body,
        incident.id,
        incident.type,
        accessToken,
      ),
      saveNotificationsToDB(uniqueUserIds, incident.id, title, body),
    ]);

    console.log(`[THÀNH CÔNG] Đã bắn Push xong cho ${tokens.length} máy!`);

    return response({
      success: true,
      total_tokens_sent: tokens.length,
      total_db_saved: uniqueUserIds.length,
    });
  } catch (e) {
    console.error("[CRASH] Lỗi nghiêm trọng:", e);
    const errorMessage = e instanceof Error ? e.message : "Unknown error";
    return response({ error: errorMessage }, 500);
  }
});

// ================= BUILD MESSAGE =================
function buildNotificationContent(
  incident: IncidentRecord,
): { title: string; body: string } {
  const typeMap: Record<string, string> = {
    "crash": "Tai nạn",
    "traffic": "Kẹt xe",
    "police": "Chốt CSGT",
    "hazard": "Nguy hiểm",
    "camera": "Camera",
    "closure": "Đường cấm",
  };
  const typeName = typeMap[incident.type] || "Sự cố";

  const sevMap: Record<string, string> = {
    "high": "nghiêm trọng",
    "medium": "trung bình",
    "low": "nhẹ",
  };
  const sevName = sevMap[incident.severity] || "";

  const title = `🚨 ${typeName} ${sevName}`.trim();

  let body = `Tại: ${incident.address || "Khu vực gần bạn"}.`;

  if (incident.description && incident.description.trim() !== "") {
    const shortDesc = incident.description.length > 60
      ? incident.description.substring(0, 60) + "..."
      : incident.description;
    body += `\nChi tiết: ${shortDesc}`;
  }

  return { title, body };
}

// ================= GET RECIPIENTS =================
async function getRecipients(reporterUid: string) {
  const { data, error } = await supabase
    .from("users")
    .select(`
      id, 
      user_devices(fcm_token)
    `)
    .eq("is_push_enabled", true)
    .eq("do_not_disturb", false)
    .neq("id", reporterUid);

  if (error) throw error;

  // Ép kiểu (Type assertion) để an toàn trong TS 6.x
  const typedData = data as Array<
    { id: string; user_devices: Array<{ fcm_token: string | null }> }
  >;

  const recipients: Array<{ id: string; fcm_token: string }> = [];

  for (const user of typedData) {
    if (user.user_devices && user.user_devices.length > 0) {
      for (const device of user.user_devices) {
        if (device.fcm_token) {
          recipients.push({ id: user.id, fcm_token: device.fcm_token });
        }
      }
    }
  }

  return recipients;
}

// ================= SAVE TO DB =================
async function saveNotificationsToDB(
  userIds: string[],
  incidentId: string,
  title: string,
  body: string,
) {
  const batchSize = 500;
  for (let i = 0; i < userIds.length; i += batchSize) {
    const batch = userIds.slice(i, i + batchSize);

    const records = batch.map((userId) => ({
      user_id: userId,
      title: title,
      body: body,
      type: "incident",
      reference_incident_id: incidentId,
      is_read: false,
    }));

    const { error } = await supabase.from("notifications").insert(records);
    if (error) {
      console.error(`Lỗi khi insert vào DB (batch ${i}):`, error);
    }
  }
}

// ================= SEND MULTIPLE FCM =================
async function sendPushToMultiple(
  tokens: string[],
  title: string,
  body: string,
  incidentId: string,
  type: string,
  accessToken: string,
) {
  const batchSize = 10;
  for (let i = 0; i < tokens.length; i += batchSize) {
    const batch = tokens.slice(i, i + batchSize);
    await Promise.all(
      batch.map((token) =>
        sendFCM(token, title, body, incidentId, type, accessToken)
      ),
    );
  }
}

// ================= TYPES DEFINITION FOR FCM =================
// Định nghĩa cấu trúc chuẩn của Google FCM Error để TS 6.0.3 không báo lỗi
interface FcmErrorResponse {
  error?: {
    code?: number;
    message?: string;
    status?: string;
    details?: Array<{
      "@type"?: string;
      errorCode?: string;
    }>;
  };
}

// ================= SEND SINGLE FCM =================
async function sendFCM(
  token: string,
  title: string,
  body: string,
  incidentId: string,
  type: string,
  accessToken: string,
): Promise<void> {
  const projectId = serviceAccount.project_id;

  try {
    const res = await fetch(
      `https://fcm.googleapis.com/v1/projects/${projectId}/messages:send`,
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${accessToken}`,
        },
        body: JSON.stringify({
          message: {
            token: token,
            notification: {
              title: title,
              body: body,
            },
            // android: {
            //   notification: {
            //     icon: "ic_notification",
            //     color: "#003265",
            //     sound: "default",
            //     click_action: "FLUTTER_NOTIFICATION_CLICK",
            //   },
            // },
            data: {
              type: "incident",
              incident_id: incidentId,
              incident_type: type,
            },
          },
        }),
      },
    );

    // 🟢 BẢO VỆ 1: Đọc Dữ liệu ĐÚNG 1 LẦN DUY NHẤT dưới dạng chuỗi Text (Tránh lỗi Body consumed)
    const responseText = await res.text();

    if (!res.ok) {
      // 🟢 BẢO VỆ 2: Khởi tạo biến với Interface chuẩn thay vì dùng 'any'
      let data: FcmErrorResponse = {};

      try {
        // Parse thủ công từ chuỗi text đã lấy ở trên
        data = JSON.parse(responseText) as FcmErrorResponse;
      } catch (_parseErr) {
        console.error(
          `[FCM] Dữ liệu trả về không phải JSON cho token ${token}:`,
          responseText,
        );
      }

      console.error(`[FCM] Error for token ${token}:`, data);

      // Kiểm tra xem có phải lỗi UNREGISTERED (Token đã chết do user gỡ app) không
      const errorCode = data.error?.details?.[0]?.errorCode;
      if (data.error?.status === "NOT_FOUND" || errorCode === "UNREGISTERED") {
        console.log(`[DỌN RÁC] Đang xóa Token đã chết khỏi Database: ${token}`);

        // Xóa thẳng tay token này khỏi bảng user_devices
        const { error: deleteErr } = await supabase
          .from("user_devices")
          .delete()
          .eq("fcm_token", token);

        if (deleteErr) {
          console.error("[DỌN RÁC] Lỗi khi xóa Token rác:", deleteErr.message);
        } else {
          console.log(`[DỌN RÁC] Đã xóa thành công.`);
        }
      }
    }
  } catch (err) {
    // 🟢 BẢO VỆ 3: Xử lý Exception chặt chẽ theo chuẩn TS 6.x (ép kiểu err thành Error)
    const errorMessage = err instanceof Error ? err.message : String(err);
    console.error(
      `[FCM] Lỗi Fetch/Mạng khi gửi tới token ${token}:`,
      errorMessage,
    );
  }
}

// ================= GOOGLE ACCESS TOKEN =================
async function getAccessToken(): Promise<string> {
  const jwtClient = new JWT({
    email: serviceAccount.client_email,
    key: serviceAccount.private_key,
    scopes: ["https://www.googleapis.com/auth/firebase.messaging"],
  });

  const tokens = await jwtClient.authorize();
  if (!tokens.access_token) {
    throw new Error("Failed to get Google Access Token");
  }
  return tokens.access_token;
}

// ================= RESPONSE HELPER =================
function response(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { "Content-Type": "application/json" },
  });
}
