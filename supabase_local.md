// Link project với database local
npx supabase link

// Pull schema từ database local vào ./migrations
npx supabase db pull

// Apply data từ ./migrations vào database local
npx supabase db reset

 <!-- BẮT BUỘC muốn lấy dữ liệu thật từ Remote về Local -->
 npx supabase db dump --data-only -f supabase/seed.sql

// chạy lại
npx supabase db reset

==============================

/// Đồng bộ local lên remote:

<!-- // Bước 1: Lưu lại sự thay đổi thành file Migration (Bắt buộc) -->
npx supabase db diff -f ten_thay_doi_cua_ban

// (Thay ten_thay_doi_cua_ban bằng tên bất kỳ không dấu, ví dụ: npx supabase db diff -f create_users_table)

<!-- // Bước 2: Kiểm tra lại (Tùy chọn) -->
// Bạn có thể mở thư mục supabase/migrations/ trong VS Code, bấm vào file SQL vừa được tạo ra để xem Supabase đã viết đúng ý bạn chưa.


<!-- Bước 3: Đẩy cấu trúc lên Remote (Cloud) -->
npx supabase db push