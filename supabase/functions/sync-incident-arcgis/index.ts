import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.38.0";

const ARCGIS_BASE_URL = "https://services7.arcgis.com/a062mjV7UpVWoyjr/arcgis/rest/services/smart_route_incidents/FeatureServer/0";

serve(async (req) => {
  try {
    const payload = await req.json();
    const eventType = payload.type; 
    const record = payload.record; 
    const oldRecord = payload.old_record; 

    console.log(`\n=================================================`);
    console.log(`[START] Bắt đầu xử lý Webhook: ${eventType}`);
    console.log(`[DATA] ID sự cố: ${record?.id || oldRecord?.id}`);
    console.log(`=================================================\n`);

    const supabaseAdmin = createClient(
      Deno.env.get("SUPABASE_URL") ?? "",
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? ""
    );

    let arcgisEndpoint = "";
    let formData = new URLSearchParams();
    formData.append("f", "json");
    
    const ARCGIS_TOKEN = Deno.env.get("ARCGIS_TOKEN");
    if (!ARCGIS_TOKEN) {
      console.warn(`[WARNING] Không tìm thấy ARCGIS_TOKEN trong biến môi trường!`);
    } else {
      formData.append("token", ARCGIS_TOKEN);
    }

    // ==========================================
    // XỬ LÝ DỮ LIỆU GỬI ĐI THEO TỪNG EVENT
    // ==========================================
    if (eventType === "INSERT") {
      arcgisEndpoint = `${ARCGIS_BASE_URL}/addFeatures`; 
      const feature = {
        geometry: { x: record.lng, y: record.lat, spatialReference: { wkid: 4326 } },
        attributes: {
          incident_uuid: record.id,
          incident_type: record.type, 
          severity: record.severity,  
          status: record.status
        }
      };
      formData.append("features", JSON.stringify([feature]));
    } 
    else if (eventType === "UPDATE") {
      if (!record.arcgis_object_id) {
        console.log(`[INFO] Bỏ qua UPDATE vì sự cố chưa có arcgis_object_id`);
        return new Response("OK", { status: 200 });
      }
      arcgisEndpoint = `${ARCGIS_BASE_URL}/updateFeatures`;
      const feature = {
        attributes: {
          OBJECTID: record.arcgis_object_id, 
          incident_uuid: record.id,
          incident_type: record.type,
          severity: record.severity, 
          status: record.status 
        },
        geometry: { x: record.lng, y: record.lat, spatialReference: { wkid: 4326 } }
      };
      formData.append("features", JSON.stringify([feature]));
    }
    else if (eventType === "DELETE") {
      if (!oldRecord.arcgis_object_id) {
        console.log(`[INFO] Bỏ qua DELETE vì sự cố chưa có arcgis_object_id`);
        return new Response("OK", { status: 200 });
      }
      arcgisEndpoint = `${ARCGIS_BASE_URL}/deleteFeatures`;
      formData.append("objectIds", oldRecord.arcgis_object_id.toString());
    } else {
      return new Response("Sự kiện không được hỗ trợ", { status: 200 });
    }

    // --- BẮT ĐẦU GỌI API ---
    console.log(`[REQUEST] URL: ${arcgisEndpoint}`);
    // In ra chính xác những gì gửi cho ArcGIS (trừ token để bảo mật)
    const logData = Object.fromEntries(formData.entries());
    delete logData.token; 
    console.log(`[REQUEST] PAYLOAD:`, JSON.stringify(logData));

    const arcgisRes = await fetch(arcgisEndpoint, {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: formData.toString()
    });
    
    // --- PHÂN TÍCH KẾT QUẢ TỪ ARCGIS ---
    console.log(`[RESPONSE] HTTP Status: ${arcgisRes.status}`);
    const arcgisText = await arcgisRes.text();
    console.log(`[RESPONSE] RAW BODY:`, arcgisText); // In ra chuỗi gốc trả về

    let arcgisData;
    try {
      arcgisData = JSON.parse(arcgisText);
    } catch (e) {
      console.error(`[ERROR] ArcGIS trả về không phải định dạng JSON!`);
      throw new Error("Lỗi phản hồi từ ArcGIS (Không phải JSON)");
    }

    // 1. Kiểm tra Lỗi Cấp Hệ Thống (Root Error - VD: Sai token, URL)
    if (arcgisData.error) {
      console.error(`[ERROR] Lỗi hệ thống ArcGIS: Code ${arcgisData.error.code} - ${arcgisData.error.message}`);
      throw new Error(`ArcGIS Error: ${arcgisData.error.message}`);
    }

    // 2. Kiểm tra chi tiết kết quả Insert
    if (eventType === "INSERT" && arcgisData.addResults) {
      const result = arcgisData.addResults[0];
      if (!result.success) {
        console.error(`[ERROR] ArcGIS từ chối INSERT: Code ${result.error?.code} - ${result.error?.description}`);
        throw new Error(`Insert thất bại: ${result.error?.description}`);
      }
      
      // Thành công -> Update lại Supabase
      const newObjectId = result.objectId;
      console.log(`[SUCCESS] ArcGIS Insert thành công! Cấp ObjectID: ${newObjectId}`);
      console.log(`[SUPABASE] Đang cập nhật arcgis_object_id vào DB...`);
      
      const { error: sbError } = await supabaseAdmin
        .from('incidents')
        .update({ arcgis_object_id: newObjectId.toString() })
        .eq('id', record.id);
        
      if (sbError) {
        console.error(`[ERROR] Không thể update Supabase:`, sbError);
      } else {
        console.log(`[SUCCESS] Đã đồng bộ hoàn tất cả 2 DB!`);
      }
    } 
    
    // 3. Kiểm tra chi tiết kết quả Update
    else if (eventType === "UPDATE" && arcgisData.updateResults) {
      const result = arcgisData.updateResults[0];
      if (!result.success) {
        console.error(`[ERROR] ArcGIS từ chối UPDATE: Code ${result.error?.code} - ${result.error?.description}`);
        throw new Error(`Update thất bại: ${result.error?.description}`);
      }
      console.log(`[SUCCESS] Cập nhật trên ArcGIS thành công!`);
    }

    // 4. Kiểm tra chi tiết kết quả Delete
    else if (eventType === "DELETE" && arcgisData.deleteResults) {
      const result = arcgisData.deleteResults[0];
      if (!result.success) {
        console.error(`[ERROR] ArcGIS từ chối DELETE: Code ${result.error?.code} - ${result.error?.description}`);
        throw new Error(`Delete thất bại: ${result.error?.description}`);
      }
      console.log(`[SUCCESS] Xóa trên ArcGIS thành công!`);
    }

    return new Response(JSON.stringify({ success: true, response: arcgisData }), {
      headers: { "Content-Type": "application/json" },
      status: 200,
    });

  } catch (error) {
    console.error(`[CRASH] HÀM BỊ LỖI BẤT NGỜ:`, error.message);
    return new Response(JSON.stringify({ error: error.message }), { status: 500 });
  }
});