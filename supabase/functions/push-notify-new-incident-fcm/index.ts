import { createClient } from 'npm:@supabase/supabase-js@2'
import { JWT } from 'npm:google-auth-library@9'
import serviceAccount from '../service-account.json' with { type: 'json' }

// ================= TYPES =================
interface Incident {
  id: string
  reported_by_uid: string
  description: string
  type: string
  severity: string
}

interface WebhookPayload {
  type: 'INSERT'
  table: string
  record: Incident
  schema: 'public'
}

interface UserData {
  id: string
  fcm_token: string | null
}

// ================= INIT =================
const supabase = createClient(
  Deno.env.get('SUPABASE_URL')!,
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
)

// ================= MAIN =================
Deno.serve(async (req) => {
  try {
    const payload: WebhookPayload = await req.json()

    // chỉ xử lý khi insert vào bảng incidents
    if (payload.table !== 'incidents') {
      return response({ message: 'Ignored' })
    }

    const incident = payload.record
    const reporterUid = incident.reported_by_uid

    // build message
    const body = buildNotificationBody(incident)

    // Lấy danh sách users (id để lưu DB, fcm_token để bắn push) trừ người báo cáo
    const recipients = await getRecipients(reporterUid)

    if (recipients.length === 0) {
      return response({ message: 'No recipients' })
    }

    // Tách riêng danh sách tokens và danh sách userIds
    const tokens = recipients
      .map((u) => u.fcm_token)
      .filter((t): t is string => t !== null && t.trim().length > 0)

    const userIds = recipients.map((u) => u.id)

    // Lấy Google Access Token cho FCM
    const accessToken = await getAccessToken()

    // Chạy SONG SONG cả 2 tác vụ: Bắn FCM và Lưu DB
    await Promise.all([
      sendPushToMultiple(tokens, body, incident.id, accessToken),
      saveNotificationsToDB(userIds, incident, body)
    ])

    return response({
      success: true,
      total: tokens.length,
      db_records_saved: userIds.length,
    })
  } catch (e) {
    console.error(e)
    return response({ error: e.message }, 500)
  }
})


// ================= BUILD MESSAGE =================
function buildNotificationBody(incident: Incident): string {
  const desc = incident.description ?? ''
  const shortDesc =
    desc.length > 80 ? desc.substring(0, 80) + '...' : desc

  return `Sự cố mới: ${incident.type} - mức độ ${incident.severity}. ${shortDesc}`
}


// ================= GET USERS =================
async function getRecipients(
  reporterUid: string
): Promise<UserData[]> {
  const { data, error } = await supabase
    .from('users')
    .select('id, fcm_token')
    .neq('id', reporterUid)

  if (error) throw error

  return (data ?? [])
}

// ================= SAVE TO DB =================
async function saveNotificationsToDB(
  userIds: string[], 
  incident: Incident, 
  body: string
) {
  // Chia mảng insert mỗi lượt 500 records để tránh quá tải payload (Batch Insert)
  const batchSize = 500

  for (let i = 0; i < userIds.length; i += batchSize) {
    const batch = userIds.slice(i, i + batchSize)
    
    const records = batch.map(userId => ({
      user_id: userId,
      body: body,
      type: 'incident', // Phân loại thông báo là "incident"
      reference_id: incident.id, // Dùng để điều hướng trong App
      is_read: false
    }))

    const { error } = await supabase
      .from('notifications')
      .insert(records)

    if (error) {
      console.error(`Lỗi khi insert vào DB (batch ${i}):`, error)
    }
  }
}


// ================= SEND MULTIPLE =================
async function sendPushToMultiple(
  tokens: string[],
  body: string,
  referenceId: string,
  accessToken: string
) {
  // tránh spam quá nhiều request cùng lúc
  // FCM HTTP v1 mỗi request là 1 tin nhắn, nên chia batch Promise.all tránh spam nghẽn mạng
  const batchSize = 10

  for (let i = 0; i < tokens.length; i += batchSize) {
    const batch = tokens.slice(i, i + batchSize)

    await Promise.all(
      batch.map((token) =>
        sendFCM(token, body, referenceId, accessToken)
      )
    )
  }
}


// ================= SEND SINGLE =================
async function sendFCM(
  token: string,
  body: string,
  referenceId: string,
  accessToken: string
) {
  const res = await fetch(
    `https://fcm.googleapis.com/v1/projects/${serviceAccount.project_id}/messages:send`,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${accessToken}`,
      },
      body: JSON.stringify({
        message: {
          token,
          notification: {
            title: 'Sự cố mới',
            body,
          },
          data: {
            type: 'incident',
            reference_id: referenceId, // Thêm ID vào data payload FCM để app biết cần mở màn hình nào
          },
        },
      }),
    }
  )

  const data = await res.json()

  if (!res.ok) {
    console.error('FCM error:', token, data)
  }
}


// ================= ACCESS TOKEN =================
async function getAccessToken(): Promise<string> {
  const jwtClient = new JWT({
    email: serviceAccount.client_email,
    key: serviceAccount.private_key,
    scopes: ['https://www.googleapis.com/auth/firebase.messaging'],
  })

  const tokens = await jwtClient.authorize()
  return tokens.access_token!
}


// ================= RESPONSE =================
function response(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'Content-Type': 'application/json' },
  })
}