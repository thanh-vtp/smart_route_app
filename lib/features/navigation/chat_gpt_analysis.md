Dựa trên những gì Thanh đã triển khai trong Smart Route App (ArcGIS Routing REST API + Incident Barriers + Flutter), có thể xem module Routing & Navigation hiện tại mới chỉ sử dụng khoảng **20-30% khả năng của ArcGIS Network Analysis**.

## 1. Chức năng Routing hiện tại của Smart Route

### ✅ Tìm đường cơ bản

```dart
stops=A;B
```

* Từ điểm A → điểm B
* Hỗ trợ nhiều điểm dừng

```dart
A -> B -> C -> D
```

### ✅ Turn-by-turn Directions

```dart
returnDirections=true
```

Ví dụ:

```text
Đi thẳng 200m
Rẽ phải vào đường 23/10
Tiếp tục 1.2km
Điểm đến ở bên trái
```

### ✅ Route Geometry

```dart
returnRoutes=true
```

Trả về polyline để vẽ trên bản đồ.

### ✅ Dynamic Incident Avoidance

```dart
pointBarriers
```

Hiện là điểm nổi bật nhất của Smart Route.

```sql
status='active'
AND severity IN ('high','medium')
```

ArcGIS tự né:

* Tai nạn
* Ngập lụt
* Kẹt xe
* Công trình thi công

---

# 2. Navigation Features Có Thể Xây Dựng

## A. Real-time Re-routing

Khi người dùng đi sai đường:

```text
GPS hiện tại
↓
Lệch khỏi route
↓
Tính route mới
↓
Tiếp tục dẫn đường
```

Giống:

* Google Maps
* Grab Driver
* Be Driver

Đây là chức năng rất phù hợp với đồ án Smart Route.

---

## B. Navigation Voice

ArcGIS trả:

```text
Turn right in 300 meters
```

Flutter TTS đọc:

```text
"300 mét nữa rẽ phải"
```

Có thể dùng:

* flutter_tts

Kết quả:

```text
🚗 Voice Navigation
```

---

## C. Off Route Detection

Theo dõi khoảng cách:

```text
Current GPS
|
|---- Route Polyline
```

Nếu:

```text
distance > 30m
```

→ Off Route

→ Tính đường mới.

---

# 3. Incident-based Smart Routing

Hiện tại app mới né sự cố.

Có thể nâng cấp thành:

## Severity-based Cost Routing

Thay vì:

```text
severity=high
=> cấm hoàn toàn
```

Có thể:

```text
low      +1 phút
medium   +5 phút
high     cấm
```

ArcGIS hỗ trợ:

```text
Scaled Cost Barrier
```

Kết quả:

```text
Ưu tiên né
thay vì bắt buộc né
```

Thông minh hơn.

---

# 4. Line Barrier

Hiện tại:

```text
●
```

một điểm sự cố.

Nhưng thực tế:

```text
=================
Đường đang thi công
=================
```

Cần:

```dart
polylineBarriers
```

Ví dụ:

```text
Đường Trần Phú
đang ngập dài 1km
```

Toàn bộ đoạn đường bị chặn.

---

# 5. Polygon Barrier

Chặn cả khu vực.

Ví dụ:

```text
Khu vực ngập lụt

+-----------+
|           |
|   Flood   |
|   Zone    |
|           |
+-----------+
```

ArcGIS:

```dart
polygonBarriers
```

Ứng dụng:

* Khu vực ngập
* Khu vực phong tỏa
* Công trường lớn
* Sự kiện đông người

---

# 6. Traffic-aware Routing

ArcGIS hỗ trợ:

```dart
startTime
TravelTime
```

Kết hợp traffic.

Ví dụ:

```text
Route A
10 km
15 phút

Route B
12 km
12 phút
```

Thông thường:

```text
Chọn A
```

Traffic-aware:

```text
Chọn B
```

vì ít kẹt xe hơn.

---

# 7. Fastest vs Shortest Route

Hiện tại thường là:

```text
Fastest
```

Có thể cho user chọn:

### Fastest

```text
15 phút
12 km
```

### Shortest

```text
20 phút
8 km
```

ArcGIS:

```dart
impedanceAttributeName
```

* TravelTime
* Kilometers

---

# 8. Alternative Routes

Google Maps thường:

```text
Route 1
15 phút

Route 2
17 phút

Route 3
18 phút
```

ArcGIS cũng hỗ trợ tìm nhiều route.

App có thể hiển thị:

```text
🟦 Route đề xuất

🟩 Route thay thế

🟨 Route tiết kiệm quãng đường
```

---

# 9. Multi-stop Optimization

Hiện tại:

```text
A -> B -> C -> D
```

Theo thứ tự người dùng nhập.

ArcGIS:

```dart
findBestSequence=true
```

Tự tối ưu:

```text
A -> C -> D -> B
```

để giảm:

* thời gian
* quãng đường

Ứng dụng:

* Shipper
* Giao hàng
* Thu gom rác
* Xe bus

---

# 10. Vehicle Profiles

## Xe máy

```text
Cho đi hẻm nhỏ
```

## Ô tô

```text
Tránh đường cấm ô tô
```

## Xe tải

```text
Tránh cầu yếu
Tránh đường giới hạn chiều cao
```

ArcGIS:

```dart
travelMode
restrictionAttributeNames
```

---

# 11. Toll Avoidance

```dart
Avoid Toll Roads
```

Kết quả:

```text
Nhanh nhất
hoặc
Không qua BOT
```

---

# 12. Highway Avoidance

```dart
Avoid Highways
```

Ứng dụng:

* Xe máy
* Người mới lái

---

# 13. Eco Routing

Tối ưu:

```text
Ít nhiên liệu nhất
```

thay vì:

```text
Nhanh nhất
```

Có thể dựa trên:

* số lần dừng
* tốc độ trung bình
* quãng đường

---

# 14. ETA Prediction

ArcGIS trả:

```text
TravelTime
```

App hiển thị:

```text
Khoảng cách:
12.3 km

Thời gian:
18 phút

ETA:
08:42
```

---

# 15. Geofencing Along Route

Ví dụ:

```text
Sắp đến điểm nguy hiểm
```

hoặc

```text
Sắp đến khu vực ngập
```

Khi người dùng vào bán kính:

```text
100m
```

→ Push Notification.

---

# Đánh giá cho Smart Route App

Nếu xét phạm vi **Chuyên đề tốt nghiệp**, mình sẽ ưu tiên theo thứ tự:

### Mức 1 (Nên có)

* ✅ Routing cơ bản
* ✅ Turn-by-turn directions
* ✅ Incident avoidance
* ✅ Re-routing khi đi sai đường
* ✅ ETA
* ✅ Voice navigation

### Mức 2 (Tăng giá trị đồ án)

* ✅ Line barriers
* ✅ Polygon barriers
* ✅ Fastest/Shortest route
* ✅ Alternative routes
* ✅ Traffic-aware routing

### Mức 3 (Nâng cao)
 1
* ✅ Multi-stop optimization
* ✅ Vehicle profiles
* ✅ Toll avoidance
* ✅ Eco routing

Riêng với Smart Route, điểm khác biệt lớn nhất so với app chỉ dùng ArcGIS thông thường là:

```text
Incident Management
+
Real-time Routing
+
Dynamic Barrier Routing
```

Tức là người dùng báo cáo sự cố → dữ liệu lưu trên Feature Layer → ArcGIS tự động xem đó là barrier → route mới được tính toán để né sự cố. Đây chính là chức năng "thông minh" nhất và đáng đưa vào phần đóng góp nổi bật của đồ án.
