4. Navigation (Có thể phát triển tiếp) - Continue to:
C:\Users\thanh\Documents\GitHub\smart_route_app\lib\features\navigation\suggest_track_location_using_in_feature_turn_by_turn_in_navigation.md

source:
https://developers.arcgis.com/flutter/toolkit/
https://developers.arcgis.com/flutter/toolkit-api-reference/arcgis_maps_toolkit/Compass-class.html


User Ask: thiết kế sử lí button location kết hợp sử dụng la bàn trong arcgis sdk flutter

Chat Response:
Nếu Thanh đang dùng **ArcGIS Maps SDK for Flutter**, thì nút **Location** nên hoạt động tương tự Google Maps, kết hợp cả:

* GPS (vị trí hiện tại)
* Compass (la bàn/heading)
* AutoPanMode của ArcGIS

Thay vì chỉ có một trạng thái "đưa camera về vị trí người dùng".

---

# Thiết kế đề xuất

## Trạng thái 1: Free Browse

Người dùng đang tự kéo bản đồ.

```text
AutoPanMode.off
```

Hiển thị:

```text
◎
```

(nút location bình thường)

### Hành vi

User bấm:

```text
Location Button
```

↓

```dart
LocationDisplayAutoPanMode.recenter
```

↓

Camera nhảy về vị trí hiện tại.

---

# Trạng thái 2: Follow User

Bản đồ theo vị trí người dùng.

```dart
LocationDisplayAutoPanMode.recenter
```

Đặc điểm:

```text
User di chuyển
↓
Map tự theo
↓
Không xoay bản đồ
```

Giống:

```text
Google Maps
bấm location lần 1
```

---

## UI

Icon chuyển sang:

```text
⬤
```

hoặc màu xanh.

---

### Hành vi

User bấm lần nữa:

↓

```dart
LocationDisplayAutoPanMode.navigation
```

---

# Trạng thái 3: Navigation / Compass

Đây là trạng thái đẹp nhất.

```dart
LocationDisplayAutoPanMode.navigation
```

ArcGIS sẽ:

* Follow vị trí
* Follow heading
* Rotate map

Ví dụ:

```text
      ↑ hướng xe

       🚗

──────────────
```

Xe luôn hướng lên trên.

Giống:

```text
Google Maps
bấm location lần 2
```

---

## UI

Icon:

```text
🧭
```

hoặc

```text
Navigation icon
```

---

### Hành vi

User bấm lần nữa:

↓

```dart
LocationDisplayAutoPanMode.off
```

↓

Quay lại trạng thái Free Browse.

---

# Vòng đời Button

```text
OFF
 ↓ tap

RECENTER
 ↓ tap

NAVIGATION
 ↓ tap

OFF
```

---

# Khi user tự kéo bản đồ

Đây là chi tiết rất quan trọng.

Nếu đang:

```dart
AutoPanMode.recenter
```

hoặc

```dart
AutoPanMode.navigation
```

mà user:

```text
Pan map
```

thì nên:

```dart
AutoPanMode.off
```

ngay lập tức.

Giống Google Maps.

---

Ví dụ:

```text
Navigation Mode

      🚗
        ↓

User kéo map

      ❌ Follow
```

↓

```text
Free Browse
```

---

# Kết hợp Turn-by-Turn Navigation

Khi user nhấn:

```text
Bắt đầu dẫn đường
```

không cần hỏi.

Tự động:

```dart
locationDisplay.autoPanMode =
    LocationDisplayAutoPanMode.navigation;
```

---

Khi:

```text
Kết thúc dẫn đường
```

↓

```dart
locationDisplay.autoPanMode =
    LocationDisplayAutoPanMode.off;
```

---

# Kiến trúc State

Có thể tạo enum:

```dart
enum LocationTrackingMode {
  off,
  follow,
  navigation,
}
```

Controller:

```dart
void onLocationButtonPressed() {
  switch (state.mode) {
    case LocationTrackingMode.off:
      setMode(LocationTrackingMode.follow);
      break;

    case LocationTrackingMode.follow:
      setMode(LocationTrackingMode.navigation);
      break;

    case LocationTrackingMode.navigation:
      setMode(LocationTrackingMode.off);
      break;
  }
}
```

Mapping:

```dart
off
→ AutoPanMode.off

follow
→ AutoPanMode.recenter

navigation
→ AutoPanMode.navigation
```

---

# Đề xuất cho Smart Route

Mình sẽ thiết kế đúng theo UX của Google Maps:

```text
Tap 1
→ Follow vị trí

Tap 2
→ Follow vị trí + la bàn

Tap 3
→ Tắt follow
```

Và khi bắt đầu Turn-by-Turn:

```text
Start Navigation
↓
Tự động chuyển
Navigation Mode
```

Kết hợp với:

```dart
SystemLocationDataSource
LocationDisplayAutoPanMode.navigation
```

của ArcGIS thì gần như không cần tự viết logic camera xoay theo hướng xe nữa, SDK đã xử lý sẵn.

=========================================
User Ask: cách tích hợp, nguồn tham khảo: https://developers.arcgis.com/flutter/toolkit/, https://developers.arcgis.com/flutter/toolkit-api-reference/arcgis_maps_toolkit/Compass-class.html

Chat Response:
Nếu Thanh đang dùng **ArcGIS Maps SDK for Flutter** thì cách tích hợp đẹp nhất là tận dụng luôn **ArcGIS Toolkit** thay vì tự làm nút la bàn.

Tài liệu Thanh tham khảo:

* [ArcGIS Flutter Toolkit](https://developers.arcgis.com/flutter/toolkit/?utm_source=chatgpt.com)
* [Compass Widget API](https://developers.arcgis.com/flutter/toolkit-api-reference/arcgis_maps_toolkit/Compass-class.html?utm_source=chatgpt.com)

---

# 1. Vai trò của Compass

Compass trong ArcGIS Toolkit **không phải GPS compass**.

Nó là:

```text
Map Rotation Compass
```

Hiển thị góc xoay hiện tại của bản đồ.

Ví dụ:

```text
Map Rotation = 0°
```

Compass sẽ ẩn hoặc chỉ hướng Bắc.

---

Khi người dùng xoay map:

```text
45°
90°
180°
```

Compass sẽ xoay theo.

---

User bấm Compass:

```text
Reset Rotation
```

↓

```text
Heading = 0°
```

↓

Bản đồ quay về hướng Bắc.

---

# 2. Khác với Location Button

Thanh nên tách riêng:

## Location Button

Điều khiển:

```dart
LocationDisplayAutoPanMode
```

* off
* recenter
* navigation

---

## Compass Widget

Điều khiển:

```text
Map Rotation
```

* Hiển thị góc xoay
* Reset hướng Bắc

---

Google Maps cũng tách như vậy:

```text
🧭 Compass

📍 My Location
```

là hai thành phần khác nhau.

---

# 3. Tích hợp Compass

Theo Toolkit:

```dart
Compass(
  geoViewController: mapViewController,
)
```

Ví dụ:

```dart
Stack(
  children: [
    ArcGISMapView(
      controllerProvider: () => _mapViewController,
    ),

    Positioned(
      top: 100,
      right: 16,
      child: Compass(
        geoViewController: _mapViewController,
      ),
    ),
  ],
)
```

Compass sẽ tự:

* đọc rotation của map
* xoay icon
* reset về North-Up khi tap

Không cần code thêm.

---

# 4. Thiết kế Location Button + Compass

Mình khuyên bố trí:

```text
┌───────────┐
│     🧭    │
│     📍    │
└───────────┘
```

---

## Compass

ArcGIS Toolkit quản lý.

```dart
Compass(
  geoViewController: mapViewController,
)
```

---

## Location Button

Thanh tự quản lý state.

Ví dụ:

```dart
enum LocationTrackingMode {
  off,
  follow,
  navigation,
}
```

---

# 5. Tích hợp với Navigation

Khi chưa dẫn đường:

```text
Map Browse
```

Location button:

```text
OFF
↓
FOLLOW
↓
NAVIGATION
```

---

Khi bắt đầu Turn-by-Turn:

```text
Start Navigation
```

tự động:

```dart
locationDisplay.autoPanMode =
    LocationDisplayAutoPanMode.navigation;
```

---

Khi đang Navigation

Compass vẫn hoạt động:

```text
Map xoay theo heading xe
```

Compass sẽ:

```text
Hiển thị góc xoay
```

Nếu người dùng chạm:

```text
🧭
```

↓

Map quay lại:

```text
North-Up
```

---

# 6. Kiến trúc đề xuất cho Smart Route

```text
Navigation Screen

 ├── ArcGISMapView
 │
 ├── Compass (Toolkit)
 │
 ├── Location Button
 │
 ├── Start Navigation
 │
 ├── ETA Panel
 │
 ├── Maneuver Panel
 │
 └── Incident Overlay
```

---

# 7. Luồng hoạt động hoàn chỉnh

```text
Mở màn hình
    ↓
Location OFF

Tap 📍
    ↓
Follow User

Tap 📍
    ↓
Navigation Mode

Tap 📍
    ↓
OFF
```

---

Khi:

```text
Start Turn-by-Turn
```

↓

```text
SystemLocationDataSource.start()
```

↓

```text
LocationDisplayAutoPanMode.navigation
```

↓

```text
Compass Widget
```

tự động hiển thị hướng xoay của bản đồ.

---

Đối với Smart Route, mình sẽ **không tự viết widget la bàn**, mà dùng luôn `Compass` của ArcGIS Toolkit vì nó đã đồng bộ trực tiếp với `MapViewController`, ít bug hơn và đúng chuẩn ArcGIS. Nút **Location** sẽ là phần Thanh tự quản lý để điều khiển các chế độ theo dõi vị trí và dẫn đường.
