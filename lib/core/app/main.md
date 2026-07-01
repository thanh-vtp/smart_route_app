/// Ví dụ hoạt động của FirebaseMessaging.

// Vui lòng sử dụng ví dụ này để xác minh xem tin nhắn có hoạt động ở trạng thái nền trước, nền sau và khi bị tắt hay không.

// Thiết lập ứng dụng của bạn theo hướng dẫn này:
/// https://firebase.google.com/docs/cloud-messaging/flutter/client#platform-specific_setup_and_requirements):

///
/// Sau khi hoàn thành các yêu cầu cụ thể của nền tảng, hãy làm theo các hướng dẫn sau:
/// 1. Cài đặt công cụ melos bằng cách chạy `flutter pub global activate melos`.

// 2. Chạy `melos bootstrap` trong dự án FlutterFire.

// 3. Trong terminal, chuyển đến thư mục gốc ./packages/firebase_messaging/firebase_messaging/example.

// 4. Chạy `flutterfire configure` trong thư mục example/ để thiết lập ứng dụng của bạn với dự án Firebase. /// 5. Mở `token_monitor.dart` và thay đổi `vapidKey` thành khóa của bạn.
/// 6. Chạy ứng dụng trên thiết bị thực (iOS), đối với Android thì chạy trên trình giả lập cũng được.
/// 7. Sử dụng đoạn mã sau để gửi tin nhắn đến thiết bị của bạn: scripts/send-message.js. Để chạy đoạn mã này,
/// bạn cần cài đặt nodejs trên máy tính. Sau đó, thực hiện các bước sau:
/// a. Tải xuống khóa tài khoản dịch vụ (tệp JSON) từ bảng điều khiển Firebase của bạn, đổi tên thành "google-services.json" và thêm vào thư mục example/scripts.
/// b. Đảm bảo thiết bị/trình giả lập của bạn đang hoạt động và chạy ứng dụng ví dụ FirebaseMessaging bằng lệnh `flutter run`.
/// c. Sao chép mã thông báo được in ra trong bảng điều khiển và dán vào đây: https://github.com/firebase/flutterfire/blob/01b4d357e1/packages/firebase_messaging/firebase_messaging/example/lib/main.dart#L32
/// c. Từ terminal của bạn, chuyển đến thư mục example/scripts và chạy `npm install`.
// d. Chạy `npm run send-message` trong thư mục example/scripts và ứng dụng của bạn sẽ nhận được tin nhắn ở bất kỳ trạng thái nào; chạy nền, chạy trước, hoặc bị tắt.
// Lưu ý: Tài liệu API của Flutter để nhận tin nhắn: https://firebase.google.com/docs/cloud-messaging/flutter/receive
/// Lưu ý: Nếu bạn thấy tin nhắn của mình ngừng đến, rất có thể chúng đang bị nền tảng hạn chế. Đặc biệt là iOS
/// có chính sách hạn chế rất nghiêm ngặt.
///
/// Để xác minh rằng tin nhắn của bạn đang được nhận, bạn phải thấy thông báo xuất hiện trên thiết bị/trình giả lập của mình thông qua plugin flutter_local_notifications.
// Định nghĩa một trình xử lý được đặt tên ở cấp cao nhất mà các tin nhắn nền/đã kết thúc sẽ gọi.
/// Hãy chắc chắn chú thích trình xử lý bằng `@pragma('vm:entry-point')` phía trên phần khai báo hàm.