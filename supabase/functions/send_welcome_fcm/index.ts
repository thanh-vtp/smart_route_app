// // Follow this setup guide to integrate the Deno language server with your editor:
// // https://deno.land/manual/getting_started/setup_your_environment
// // This enables autocomplete, go to definition, etc.

// // Setup type definitions for built-in Supabase Runtime APIs
// import "@supabase/functions-js/edge-runtime.d.ts"

// console.log("Hello from Functions!")

// Deno.serve(async (req) => {
//   const { name } = await req.json()
//   const data = {
//     message: `Hello ${name}!`,
//   }

//   return new Response(
//     JSON.stringify(data),
//     { headers: { "Content-Type": "application/json" } },
//   )
// })

// /* To invoke locally:

//   1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
//   2. Make an HTTP request:

//   curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/send_welcome_fcm' \
//     --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
//     --header 'Content-Type: application/json' \
//     --data '{"name":"Functions"}'

// */

import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { initializeApp, cert, getApp } from "npm:firebase-admin@11.10.1/app"
import { getMessaging } from "npm:firebase-admin@11.10.1/messaging"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders })

  try {
    const payload = await req.json()
    console.log("Dữ liệu nhận được:", JSON.stringify(payload))

    const fcmToken = payload.record?.fcm_token 
    if (!fcmToken) throw new Error("Không tìm thấy fcm_token trong record")

    // Khởi tạo Firebase bên trong try-catch để nếu lỗi sẽ hiện Log
    let app;
    try {
      app = getApp();
    } catch (e) {
      const sa = Deno.env.get('FIREBASE_SERVICE_ACCOUNT');
      if (!sa) throw new Error("Biến FIREBASE_SERVICE_ACCOUNT trống rỗng!");
      
      // Log thử 20 ký tự đầu để xem nó có phải JSON không
      console.log("Bắt đầu parse JSON Service Account...");
      app = initializeApp({ credential: cert(JSON.parse(sa)) });
    }

    const message = {
      notification: { title: 'Chào mừng! 🎉', body: 'Thông báo từ Edge Function' },
      token: fcmToken,
    }

    const res = await getMessaging(app).send(message)
    console.log("Gửi thành công ID:", res)
    
    return new Response(JSON.stringify({ success: true }), { headers: { ...corsHeaders, "Content-Type": "application/json" } })

  } catch (error) {
    console.error("LỖI CỤ THỂ:", error.message) // Dòng này sẽ hiện ở tab Log màu đỏ
    return new Response(JSON.stringify({ error: error.message }), { 
      status: 500, 
      headers: { ...corsHeaders, "Content-Type": "application/json" } 
    })
  }
})