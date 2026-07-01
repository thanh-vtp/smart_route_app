-- Kích hoạt extension cần thiết
CREATE EXTENSION IF NOT EXISTS pg_net;
CREATE EXTENSION IF NOT EXISTS pg_cron;


-- Tạo job mới: Chạy mỗi 1 phút (Để * * * * * thay vì 5 phút để test cho lẹ)
SELECT cron.schedule(
  'invoke_cluster_notification_job',
  '* * * * *', -- Chạy mỗi phút 1 lần
  $$
    SELECT net.http_post(
        url:='https://ysfowqhbbaohkdmvwdja.supabase.co/functions/v1/push-notify-cluster-density-fcm',
        headers:='{"Content-Type": "application/json", "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlzZm93cWhiYmFvaGtkbXZ3ZGphIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM5OTQ2MDcsImV4cCI6MjA3OTU3MDYwN30.Zl-oxtFmX2jMenav_xbrb3b3n_8rvFzBlGClSEL1spA"}'::jsonb,
        body:='{}'::jsonb
    ) as request_id;
  $$
);


/// dừng job
SELECT cron.unschedule('invoke_cluster_notification_job');

/// Cách kiểm tra xem đã xóa thành công chưa
SELECT jobid, jobname, schedule FROM cron.job;

/// xem tổng số lần job đã chạy
SELECT count(*) AS tong_so_lan_chay
FROM cron.job_run_details d
JOIN cron.job j ON d.jobid = j.jobid
WHERE j.jobname = 'invoke_cluster_notification_job';

/// Xem chi tiết lịch sử 10 lần chạy gần nhất
SELECT 
  d.runid, 
  j.jobname,
  d.status, 
  d.return_message, 
  d.start_time, 
  d.end_time
FROM cron.job_run_details d
JOIN cron.job j ON d.jobid = j.jobid
WHERE j.jobname = 'invoke_cluster_notification_job'
ORDER BY d.start_time DESC 
LIMIT 10;

/// Điều chỉnh lại thời gian Cron Job (Tránh spam user)
Mỗi 15 phút: */15 * * * *
Mỗi 30 phút: */30 * * * *
Mỗi 1 giờ: 0 * * * *