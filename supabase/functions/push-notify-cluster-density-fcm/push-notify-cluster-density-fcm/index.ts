import { createClient } from 'npm:@supabase/supabase-js@2';
import { JWT } from 'npm:google-auth-library@9';
import serviceAccount from '../service-account.json' with {
  type: 'json'
};
// ================= INIT =================
const supabase = createClient(Deno.env.get('SUPABASE_URL'), Deno.env.get('SUPABASE_SERVICE_ROLE_KEY'));
// Lấy URL từ biến môi trường, hoặc điền cứng URL thật của bạn vào đây
const PYTHON_API_URL = Deno.env.get('PYTHON_API_URL') || 'https://your-python-domain.com/api/clustering';
// ================= MAIN =================
Deno.serve(async (req)=>{
  try {
    // 1. Gọi API Python để lấy data phân cụm
    console.log('Đang fetch data từ Python API...');
    const response = await fetch(PYTHON_API_URL);
    if (!response.ok) throw new Error('Không thể kết nối Python API');
    const pyData = await response.json();
    if (pyData.status !== 'success' || !pyData.data || pyData.data.length === 0) {
      return new Response(JSON.stringify({
        message: 'Không có dữ liệu sự cố'
      }));
    }
    // 2. Thuật toán tìm Cụm (Cluster) có mật độ cao nhất
    const clusterCounts = {};
    pyData.data.forEach((item)=>{
      // Bỏ qua nhiễu (Cluster_ID = -1)
      if (item.Cluster_ID !== -1) {
        clusterCounts[item.Cluster_ID] = (clusterCounts[item.Cluster_ID] || 0) + 1;
      }
    });
    // Tìm Cluster lớn nhất
    let maxClusterId = -1;
    let maxDensity = 0;
    for (const [clusterIdStr, count] of Object.entries(clusterCounts)){
      if (count > maxDensity) {
        maxDensity = count;
        maxClusterId = parseInt(clusterIdStr);
      }
    }
    // 3. Kiểm tra ngưỡng cảnh báo (Ví dụ: Chỉ thông báo nếu cụm đó có từ 3 sự cố trở lên)
    if (maxDensity < 3) {
      return new Response(JSON.stringify({
        message: `Mật độ cao nhất chỉ là ${maxDensity}. Bỏ qua thông báo.`
      }));
    }
    // 4. Build tin nhắn thông báo
    const title = 'Cảnh báo vùng nguy hiểm';
    const body = `Hệ thống phát hiện một khu vực đang tập trung mật độ cao với ${maxDensity} sự cố. Vui lòng kiểm tra bản đồ để tránh khu vực này.`;
    // 5. Lấy danh sách Users để thông báo
    const { data: users, error: dbError } = await supabase.from('users').select('id, fcm_token');
    if (dbError) throw dbError;
    const tokens = users.map((u)=>u.fcm_token).filter((t)=>t && t.trim().length > 0);
    const userIds = users.map((u)=>u.id);
    if (tokens.length === 0) {
      return new Response(JSON.stringify({
        message: 'Không có user nào có token'
      }));
    }
    // 6. Gửi Push và Lưu Database
    const accessToken = await getAccessToken();
    await Promise.all([
      sendPushToMultiple(tokens, title, body, maxClusterId.toString(), accessToken),
      saveNotificationsToDB(userIds, title, body, maxClusterId)
    ]);
    return new Response(JSON.stringify({
      success: true,
      message: `Đã cảnh báo cụm ${maxClusterId} với ${maxDensity} sự cố cho ${tokens.length} users`
    }));
  } catch (e) {
    console.error(e);
    return new Response(JSON.stringify({
      error: e instanceof Error ? e.message : 'Error'
    }), {
      status: 500
    });
  }
});
// ================= CÁC HÀM PHỤ TRỢ =================
async function saveNotificationsToDB(userIds, title, body, clusterId) {
  const batchSize = 500;
  for(let i = 0; i < userIds.length; i += batchSize){
    const batch = userIds.slice(i, i + batchSize);
    const records = batch.map((userId)=>({
        user_id: userId,
        body: body,
        type: 'cluster_alert',
        reference_id: null,
        cluster_id: clusterId,
        is_read: false
      }));
    await supabase.from('notifications').insert(records);
  }
}
async function sendPushToMultiple(tokens, title, body, clusterIdStr, accessToken) {
  const batchSize = 10;
  for(let i = 0; i < tokens.length; i += batchSize){
    const batch = tokens.slice(i, i + batchSize);
    await Promise.all(batch.map((token)=>sendFCM(token, title, body, clusterIdStr, accessToken)));
  }
}
async function sendFCM(token, title, body, clusterIdStr, accessToken) {
  await fetch(`https://fcm.googleapis.com/v1/projects/${serviceAccount.project_id}/messages:send`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${accessToken}`
    },
    body: JSON.stringify({
      message: {
        token,
        notification: {
          title,
          body
        },
        data: {
          type: 'cluster_alert',
          cluster_id: clusterIdStr
        }
      }
    })
  });
}
async function getAccessToken() {
  const jwtClient = new JWT({
    email: serviceAccount.client_email,
    key: serviceAccount.private_key,
    scopes: [
      'https://www.googleapis.com/auth/firebase.messaging'
    ]
  });
  const tokens = await jwtClient.authorize();
  return tokens.access_token;
}
