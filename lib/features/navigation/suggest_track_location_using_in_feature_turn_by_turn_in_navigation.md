4. Navigation (Có thể phát triển tiếp) - Continue to:
C:\Users\thanh\Documents\GitHub\smart_route_app\lib\features\navigation\suggest_map_view_for_feature_turn_by_turn_in_navigation.md

source: 
https://developers.arcgis.com/flutter/device-location/
https://developers.arcgis.com/flutter/device-location/background-location-tracking/


User Ask: sử dụng track location liên tục liên tục khi đang sử dụng turn by turn in navigation , khi tắt sử dụng turn by turn in navigation, thì bỏ track location liên tục liên tục, chứ không tắt gps/device location đúng hay sai

Chat Response:
Đúng.

Thanh nên phân biệt rõ **3 khái niệm khác nhau**:

### 1. GPS / Device Location Service

Đây là dịch vụ vị trí của hệ điều hành:

* Android Location Services
* iOS Core Location

Ví dụ:

```text
Cài đặt điện thoại
→ Vị trí (Location)
→ Bật
```

Ứng dụng của Thanh **không nên tự tắt** cái này.

Chỉ người dùng mới quyết định:

```text
Location ON
Location OFF
```

---

### 2. App đang subscribe Location Stream

Ví dụ:

```dart
_positionSubscription =
    Geolocator.getPositionStream(...)
        .listen(...);
```

Lúc này:

```text
GPS
↓
Flutter App
↓
Nhận tọa độ liên tục
```

App đang theo dõi vị trí realtime.

---

### 3. Turn-by-Turn Navigation Session

Ví dụ:

```text
Bắt đầu dẫn đường
↓
Track GPS liên tục
↓
Tính ETA
↓
Off-route Detection
↓
Voice Navigation
```

Đây mới là thứ cần bật/tắt.

---

# Luồng đúng

## Khi user bắt đầu Navigation

```text
Nhấn "Bắt đầu dẫn đường"
↓
startNavigation()
↓
startLocationTracking()
↓
listen GPS stream
```

Ví dụ:

```dart
void startNavigation() {
  _locationSubscription =
      Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.bestForNavigation,
          distanceFilter: 5,
        ),
      ).listen(_onLocationChanged);
}
```

---

## Khi user kết thúc Navigation

```text
Nhấn "Kết thúc"
↓
stopNavigation()
↓
cancel GPS stream
```

Ví dụ:

```dart
Future<void> stopNavigation() async {
  await _locationSubscription?.cancel();
  _locationSubscription = null;
}
```

---

## Nhưng KHÔNG làm

```dart
await Geolocator.openLocationSettings();
```

hoặc

```text
Location OFF
```

vì:

* Ảnh hưởng ứng dụng khác.
* Android/iOS không cho app tự tắt GPS hệ thống.
* Trải nghiệm người dùng rất tệ.

---

# Kiến trúc nên có

```text
Navigation Mode OFF

GPS Service: ON
Location Stream: OFF
```

↓

Người dùng bấm:

```text
Start Navigation
```

↓

```text
Navigation Mode ON

GPS Service: ON
Location Stream: ON
```

↓

Người dùng bấm:

```text
Stop Navigation
```

↓

```text
Navigation Mode OFF

GPS Service: ON
Location Stream: OFF
```

---

# Lợi ích

### Tiết kiệm pin

Navigation thường dùng:

```dart
LocationAccuracy.bestForNavigation
```

Pin khá tốn.

Nếu cứ track liên tục dù người dùng không dẫn đường:

```text
Pin ↓
CPU ↓
Network ↓
```

---

### Giảm tải hệ thống

Không cần:

```text
Off-route Detection
ETA Update
Progress Update
Voice Guidance
```

khi người dùng chỉ đang xem bản đồ.

---

# Với Smart Route

Mình sẽ thiết kế trạng thái như sau:

```text
Map Browsing Mode
    ↓
Không track realtime
```

```text
Route Preview Mode
    ↓
Không track realtime
```

```text
Navigation Mode
    ↓
Track realtime
    ↓
ETA
    ↓
Voice
    ↓
Re-route
```

Tức là chỉ khi người dùng bấm **"Bắt đầu điều hướng"** thì mới subscribe `Geolocator.getPositionStream()`. Khi thoát điều hướng hoặc tới đích thì hủy subscription. GPS của thiết bị vẫn bật bình thường và các ứng dụng khác vẫn sử dụng được. Đây là cách mà hầu hết các ứng dụng điều hướng thực tế triển khai.

=============================
User Ask: source tham khảo: https://developers.arcgis.com/flutter/device-location/background-location-tracking/

Chat Response:
Nguồn Thanh tham khảo thực ra đã trả lời khá rõ câu hỏi này.

Trong tài liệu ArcGIS:

> "For most mobile apps, location updates are only needed when the app is in the foreground. For example, a navigation app that provides turn-by-turn directions only needs to know the user's location when the app is open." ([developers.arcgis.com][1])

Dịch ý:

> Đối với hầu hết ứng dụng di động, cập nhật vị trí chỉ cần khi ứng dụng đang ở foreground. Ví dụ, một ứng dụng điều hướng turn-by-turn chỉ cần biết vị trí người dùng khi ứng dụng đang mở. ([developers.arcgis.com][1])

---

## Áp dụng cho Smart Route

### Khi đang Turn-by-Turn Navigation

```text
Navigation ON
    ↓
Location Stream ON
    ↓
GPS updates liên tục
    ↓
ETA
Off-route Detection
Re-routing
Voice Guidance
```

Lúc này:

```dart
SystemLocationDataSource.start()
```

hoặc

```dart
Geolocator.getPositionStream()
```

được duy trì liên tục.

---

### Khi người dùng kết thúc Navigation

```text
Navigation OFF
    ↓
Stop listening location
```

Ví dụ:

```dart
await locationSubscription.cancel();
```

hoặc:

```dart
await locationDataSource.stop();
```

Theo tài liệu ArcGIS, LocationDataSource có cơ chế:

```dart
start()
stop()
```

để bật/tắt nhận cập nhật vị trí. ([developers.arcgis.com][2])

---

## Không nên dùng Background Tracking cho Turn-by-Turn thông thường

ArcGIS ghi rõ:

> Đa số ứng dụng chỉ cần location khi ở foreground; background tracking chỉ dành cho các trường hợp đặc biệt như ghi lại hành trình, geofencing, theo dõi nhân viên hiện trường hoặc cảnh báo dựa trên vị trí. ([developers.arcgis.com][1])

Ví dụ cần Background Tracking:

* App chạy bộ
* App đạp xe
* App ghi nhật ký hành trình
* Geofencing
* Theo dõi shipper
* Theo dõi nhân viên giao hàng

([developers.arcgis.com][1])

---

## Với Smart Route nên thiết kế thế nào?

### Chế độ xem bản đồ

```text
Map Screen
```

* Không track liên tục.
* Chỉ lấy vị trí khi cần.

---

### Chế độ xem route

```text
Route Preview
```

* Không track liên tục.
* Chỉ hiển thị route.

---

### Chế độ dẫn đường

```text
Turn-by-Turn Navigation
```

* Track liên tục.
* ETA.
* Remaining Distance.
* Voice.
* Off-route.
* Re-route.

---

### Thoát dẫn đường

```text
Exit Navigation
```

↓

```dart
locationSubscription.cancel();
```

↓

```dart
locationDataSource.stop();
```

↓

Ngừng nhận GPS update.

---

## Nếu sau này làm tính năng "Theo dõi hành trình"

Ví dụ:

```text
Bắt đầu ghi lại chuyến đi
```

thì lúc đó mới nên xem xét:

```dart
SystemLocationDataSource.backgroundUpdatesEnabled = true;
```

và cấu hình Background Location theo tài liệu ArcGIS. Tuy nhiên ArcGIS cũng cảnh báo rằng việc cập nhật vị trí liên tục trong nền có thể làm hao pin đáng kể. ([developers.arcgis.com][1])

Với Smart Route hiện tại, **Turn-by-Turn Navigation → foreground tracking là đủ và đúng thiết kế của các ứng dụng điều hướng phổ biến**. Background location tracking chưa phải yêu cầu bắt buộc. ([developers.arcgis.com][1])

[1]: https://developers.arcgis.com/flutter/device-location/background-location-tracking/?utm_source=chatgpt.com "Background location tracking | ArcGIS Maps SDK for Flutter | Esri Developer"
[2]: https://developers.arcgis.com/flutter/device-location/?utm_source=chatgpt.com "Device location | ArcGIS Maps SDK for Flutter | Esri Developer"

=================================================
User Ask: source tham khảo: https://developers.arcgis.com/flutter/device-location/

Chat Response:
Từ tài liệu ArcGIS Device Location mà Thanh gửi, có một số điểm rất quan trọng cho thiết kế Turn-by-Turn Navigation.

## 1. ArcGIS đã có sẵn LocationDataSource

ArcGIS không bắt buộc phải dùng Geolocator.

Có thể dùng trực tiếp:

```dart
final locationDataSource = SystemLocationDataSource();

mapViewController.locationDisplay.dataSource =
    locationDataSource;
```

Sau đó:

```dart
await locationDataSource.start();
```

để bắt đầu nhận cập nhật vị trí. ([developers.arcgis.com][1])

Khi kết thúc:

```dart
await locationDataSource.stop();
```

để ngừng nhận cập nhật vị trí. ([developers.arcgis.com][1])

---

## 2. ArcGIS thiết kế theo mô hình Start / Stop

Trong tài liệu:

```text
To start and stop displaying location,
you need to call start() and stop().
```

ArcGIS coi việc nhận GPS là một dịch vụ có thể bật/tắt theo nhu cầu của ứng dụng. ([developers.arcgis.com][1])

Điều này hoàn toàn khớp với luồng Navigation:

```text
Start Navigation
    ↓
locationDataSource.start()

Stop Navigation
    ↓
locationDataSource.stop()
```

---

## 3. LocationDisplay có sẵn Navigation Mode

Đây là điểm nhiều người bỏ qua.

ArcGIS LocationDisplay hỗ trợ:

```dart
LocationDisplayAutoPanMode.navigation
```

([developers.arcgis.com][1])

Mode này được mô tả là:

> Best for in-vehicle navigation. The map pans and rotates based on location updates and direction of travel. ([developers.arcgis.com][1])

Nói đơn giản:

```text
Xe luôn đứng yên giữa màn hình
↓
Bản đồ xoay theo hướng di chuyển
↓
Bản đồ tự cuộn phía trước
```

Giống:

* Google Maps
* Waze
* Here WeGo

---

## 4. Có thể tận dụng ngay cho Smart Route

Khi user bấm:

```text
Bắt đầu dẫn đường
```

có thể:

```dart
await locationDataSource.start();

mapViewController.locationDisplay.autoPanMode =
    LocationDisplayAutoPanMode.navigation;
```

([developers.arcgis.com][1])

Khi user thoát:

```dart
await locationDataSource.stop();

mapViewController.locationDisplay.autoPanMode =
    LocationDisplayAutoPanMode.off;
```

([developers.arcgis.com][1])

---

## 5. Không cần tự viết camera follow

Nhiều project Flutter thường:

```dart
mapView.setViewpoint(...)
```

mỗi lần GPS thay đổi.

Nhưng ArcGIS đã có sẵn:

```dart
LocationDisplayAutoPanMode.navigation
```

để:

* follow user
* rotate map
* giữ vị trí xe trên màn hình

([developers.arcgis.com][1])

Nên tận dụng thay vì tự code.

---

## 6. Rất phù hợp với REST Routing hiện tại

Thanh đang dùng:

```text
ArcGIS REST Solve Route
```

để lấy:

```text
Polyline Route
Directions
Distance
Duration
```

Sau đó dùng:

```text
SystemLocationDataSource
```

để lấy GPS realtime.

Đây là 2 phần hoàn toàn độc lập:

```text
Route REST API
        ↓
Route Geometry

SystemLocationDataSource
        ↓
GPS Stream

Navigation Controller
        ↓
ETA
Progress
Off Route
Re-routing
```

Không có xung đột gì cả.

---

## 7. Một tính năng rất hữu ích cho việc test

ArcGIS còn có:

```dart
SimulatedLocationDataSource
```

([developers.arcgis.com][1])

Có thể feed chính route polyline vào:

```dart
locationDataSource.setLocationsWithPolyline(...)
```

ArcGIS sẽ giả lập xe chạy trên tuyến đường. ([developers.arcgis.com][1])

Điều này cực kỳ hữu ích khi Thanh muốn test:

* ETA
* Turn-by-turn
* Voice guidance
* Re-routing

mà không cần mang điện thoại ra ngoài đường.

---

### Đề xuất cho Smart Route

Nếu mình thiết kế tiếp module Navigation của Thanh thì sẽ ưu tiên:

```text
Bước 1
✓ SystemLocationDataSource
✓ LocationDisplayAutoPanMode.navigation

Bước 2
✓ Route Progress
✓ Remaining Distance
✓ ETA

Bước 3
✓ Current Maneuver
✓ Voice Guidance

Bước 4
✓ Off Route Detection

Bước 5
✓ Auto Re-routing
✓ Incident-aware Re-routing
```

Trong đó **Bước 1** gần như ArcGIS đã hỗ trợ sẵn, Thanh chỉ cần bật `SystemLocationDataSource` và `LocationDisplayAutoPanMode.navigation` là đã có trải nghiệm dẫn đường giống các ứng dụng navigation cơ bản.

[1]: https://developers.arcgis.com/flutter/device-location/?utm_source=chatgpt.com "Device location | ArcGIS Maps SDK for Flutter | Esri Developer"

