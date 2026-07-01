Để làm chủ hoàn toàn hệ thống Push Notification (Thông báo đẩy) với Firebase trên Flutter, bạn bắt buộc phải hiểu rõ **3 Trạng thái sinh tồn của Ứng dụng**. 

Hệ điều hành (Android/iOS) sẽ có cách ứng xử hoàn toàn khác nhau tùy thuộc vào việc lúc đó App của bạn đang ở trạng thái nào.

Dưới đây là cẩm nang chi tiết nhất về 3 trường hợp hiện thông báo:

---

### 🟢 TRƯỜNG HỢP 1: FOREGROUND (App đang mở trên màn hình)
*   **Tình trạng:** Bạn đang cầm điện thoại, mở app Smart Route sáng rực trên màn hình và lướt bản đồ.
*   **Hệ điều hành (Android/iOS) làm gì:** Nó nghĩ rằng *"À, người dùng đang dùng app rồi, mình không cần hiện Banner báo động từ trên rớt xuống nữa làm phiền họ"*. Hệ điều hành sẽ **KHÔNG LÀM GÌ CẢ**.
*   **Hàm Flutter bị đánh thức:** `FirebaseMessaging.onMessage.listen(...)`
*   **Nhiệm vụ của lập trình viên:** Vì hệ điều hành không hiện thông báo, nên chúng ta **BẮT BUỘC phải code tay** gọi thư viện `flutter_local_notifications` (`showFlutterNotification()`) để tự vẽ ra một cái Banner báo cho user biết.
*   **Ví dụ thực tế:** Đang xem bản đồ, tự nhiên có cái banner nhỏ nhảy xuống "Có tai nạn cách bạn 2km".

---

### 🟡 TRƯỜNG HỢP 2: BACKGROUND (App đang chạy ngầm)
*   **Tình trạng:** Bạn đang mở app Smart Route, nhưng bạn bấm nút Home để ra ngoài lướt Facebook, xem TikTok.
*   **Hệ điều hành làm gì:** Nó đọc thấy block `notification: { title, body }` từ Server gửi về và **TỰ ĐỘNG VẼ BANNER** rớt xuống màn hình (kèm âm thanh tinh tinh).
*   **Hàm Flutter bị đánh thức (Ngầm):** `firebaseMessagingBackgroundHandler`. Ở đây ta không được phép vẽ UI nữa (nếu vẽ sẽ bị lỗi 2 thông báo đè nhau như bạn vừa bị).
*   **Khi user CHẠM vào thông báo:** Hàm `FirebaseMessaging.onMessageOpenedApp.listen(...)` sẽ được gọi.
*   **Nhiệm vụ của lập trình viên:** Hứng cục `data` ở hàm này, và dùng GoRouter chuyển hướng user vào đúng màn hình chi tiết sự cố.

---

### 🔴 TRƯỜNG HỢP 3: TERMINATED / KILLED (App đã bị tắt hoàn toàn)
*   **Tình trạng:** Bạn mở giao diện đa nhiệm, **vuốt tắt luôn** cái app Smart Route đi (Kill App).
*   **Hệ điều hành làm gì:** Giống hệt trường hợp Background. Hệ điều hành vẫn **TỰ ĐỘNG VẼ BANNER** rớt xuống màn hình (Nhờ Dịch vụ Google Play chạy ngầm).
*   **Khi user CHẠM vào thông báo:** Hệ điều hành sẽ khởi động lại App của bạn từ đầu (Màn hình Splash -> Load Map). 
*   **Hàm Flutter bị đánh thức:** `FirebaseMessaging.instance.getInitialMessage()`.
*   **Nhiệm vụ của lập trình viên:** Trong hàm `initState` của màn hình chính, gọi hàm `getInitialMessage()`. Nếu thấy có cục `data` bị kẹt lại trong đó, phải lôi nó ra và tự động bật BottomSheet chi tiết sự cố lên.

---

### 🎯 TỔNG KẾT BẢNG MÀ TRĂM (Ma trận xử lý)

Để dễ nhớ nhất, bạn lưu lại bảng này:

| Trạng thái App | Ai vẽ Banner thông báo? | Chạm vào thì hàm nào bắt? |
| :--- | :--- | :--- |
| **Foreground** (Đang mở) | **Flutter** (`flutter_local_notifications`) | Hàm `onDidReceiveNotificationResponse` của Local Notification |
| **Background** (Chạy ngầm) | **Hệ điều hành** (Android/iOS) | Hàm `FirebaseMessaging.onMessageOpenedApp` |
| **Terminated** (Tắt hẳn) | **Hệ điều hành** (Android/iOS) | Hàm `FirebaseMessaging.instance.getInitialMessage()` |

*(Đó chính là lý do vì sao ở code `MainScaffold` mấy hôm trước, tôi đã cung cấp cho bạn đầy đủ cả 3 hàm lắng nghe này. Chỉ cần lắp đúng logic, ứng dụng của bạn sẽ hoạt động hoàn mỹ ở mọi tư thế của người dùng!)*