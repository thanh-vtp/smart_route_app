4. Navigation (Có thể phát triển tiếp) - Continue to:
C:\Users\thanh\Documents\GitHub\smart_route_app\lib\features\navigation\chat_gpt_current_and_future.md
C:\Users\thanh\Documents\GitHub\smart_route_app\lib\features\navigation\chat_gpt_analysis.md

source: 
Điều hướng tuyến đường: https://developers.arcgis.com/flutter/sample-code/navigate-route/
Điều hướng tuyến đường với tính năng định tuyến lại: https://developers.arcgis.com/flutter/sample-code/navigate-route-with-rerouting/


User Ask:
vừa tích hợp 6. Routing Nâng Cao Mà ArcGIS Hỗ Trợ, tiếp theo 4. Navigation (Có thể phát triển tiếp), tôi vừa tham khảo https://developers.arcgis.com/flutter/sample-code/navigate-route/, https://developers.arcgis.com/flutter/sample-code/navigate-route-with-rerouting/

Chat Response:

Nếu Thanh vừa hoàn thành phần **Routing nâng cao mà ArcGIS hỗ trợ** và đang nghiên cứu hai sample:

* [Navigate Route Sample](https://developers.arcgis.com/flutter/sample-code/navigate-route/?utm_source=chatgpt.com)
* [Navigate Route With Rerouting Sample](https://developers.arcgis.com/flutter/sample-code/navigate-route-with-rerouting/?utm_source=chatgpt.com)

thì hướng phát triển tiếp theo của module **Navigation** có thể được mô tả trong báo cáo như sau:

### Định hướng phát triển chức năng điều hướng thời gian thực

Sau khi hoàn thiện các chức năng định tuyến (Routing) như tính toán lộ trình, hiển thị hướng dẫn rẽ từng bước, lựa chọn tuyến đường tối ưu và hỗ trợ tránh các khu vực xảy ra sự cố giao thông, hệ thống có thể tiếp tục mở rộng sang nhóm chức năng điều hướng thời gian thực (Navigation).

Khác với Routing chỉ thực hiện tính toán tuyến đường trước khi bắt đầu hành trình, Navigation tập trung vào việc theo dõi vị trí của người dùng trong suốt quá trình di chuyển và cung cấp hướng dẫn liên tục theo thời gian thực.

Chức năng đầu tiên có thể được triển khai là theo dõi vị trí hiện tại của người dùng trên tuyến đường. Hệ thống sử dụng dữ liệu GPS từ thiết bị để xác định vị trí hiện tại và so sánh với tuyến đường đã được tính toán trước đó. Thông qua cơ chế này, ứng dụng có thể hiển thị tiến trình di chuyển, quãng đường còn lại và thời gian dự kiến đến điểm đích (Estimated Time of Arrival - ETA).

Tiếp theo, hệ thống có thể cung cấp chế độ dẫn đường theo từng bước (Turn-by-Turn Navigation). Các hướng dẫn điều hướng như đi thẳng, rẽ trái, rẽ phải hoặc quay đầu được hiển thị dựa trên dữ liệu Directions trả về từ ArcGIS Routing Service. Chức năng này giúp người dùng dễ dàng theo dõi lộ trình mà không cần liên tục quan sát toàn bộ bản đồ.

Một tính năng quan trọng khác là phát hiện lệch tuyến đường (Off-route Detection). Trong quá trình di chuyển, hệ thống liên tục đánh giá khoảng cách giữa vị trí hiện tại của người dùng và tuyến đường đã được tính toán. Khi khoảng cách này vượt quá một ngưỡng xác định, hệ thống sẽ xác định rằng người dùng đã đi lệch khỏi lộ trình ban đầu.

Trên cơ sở đó, chức năng điều hướng lại tự động (Auto Re-routing) có thể được triển khai. Khi phát hiện người dùng đi sai hướng hoặc không thể tiếp tục di chuyển theo tuyến đường hiện tại, hệ thống sẽ sử dụng vị trí GPS hiện tại làm điểm xuất phát mới và thực hiện tính toán lại lộ trình đến đích. Quá trình này được thực hiện hoàn toàn tự động nhằm đảm bảo người dùng luôn nhận được tuyến đường phù hợp với tình trạng thực tế.

Đối với ứng dụng Smart Route, cơ chế điều hướng lại còn có thể kết hợp với hệ thống quản lý sự cố giao thông. Khi xuất hiện các sự cố mới được cập nhật trên bản đồ trong thời gian người dùng đang di chuyển, hệ thống có thể tự động tính toán lại tuyến đường nhằm tránh các khu vực bị ảnh hưởng, từ đó nâng cao khả năng hỗ trợ ra quyết định và tối ưu hóa hành trình.

### Theo góc độ kỹ thuật ArcGIS

Hai sample mà Thanh đang xem thực chất cung cấp gần như đầy đủ nền tảng cho:

1. **Location Tracking**

   * Theo dõi GPS thời gian thực.

2. **Route Progress Tracking**

   * Xác định người dùng đang ở bước điều hướng nào.

3. **Maneuver Navigation**

   * Lấy instruction hiện tại.
   * Lấy instruction tiếp theo.

4. **Voice Navigation**

   * Kết hợp `flutter_tts`.

5. **Off-route Detection**

   * ArcGIS tự xác định người dùng lệch route.

6. **Auto Re-routing**

   * Tính route mới từ vị trí hiện tại.

7. **Smart Incident Re-routing** *(điểm khác biệt của Smart Route)*

   * Route mới vẫn áp dụng:

   ```sql
   status = 'active'
   AND severity IN ('high', 'medium')
   ```

   * Tiếp tục tránh các sự cố đang hoạt động.

Đối với đồ án của Thanh, mình đánh giá **Auto Re-routing kết hợp Incident Avoidance** là tính năng có giá trị học thuật cao nhất vì nó thể hiện được tính "thông minh" của hệ thống thay vì chỉ đơn thuần gọi Routing API.

====================================================
User Ask: cách tích hợp vào mã nguồn

Chat Response:

Nếu Thanh đang dùng **ArcGIS Routing REST API** để tính đường, thì có 2 hướng tích hợp Navigation:

## Hướng 1: Tự xây dựng Navigation (khuyến nghị cho project hiện tại)

Giữ nguyên code Routing hiện có:

```text
Flutter
   ↓
RoutingRepository
   ↓
ArcGIS REST Route API
```

Sau đó bổ sung:

```text
Geolocator
   ↓
GPS realtime
   ↓
NavigationController
   ↓
Theo dõi tiến trình
   ↓
Re-routing
```

Kiến trúc:

```text
features/
└── navigation/
    ├── presentation/
    │   ├── providers/
    │   ├── screens/
    │   └── widgets/
    │
    ├── domain/
    │   ├── entities/
    │   ├── repositories/
    │   └── usecases/
    │
    └── data/
        ├── datasources/
        ├── repositories/
        └── models/
```

---

### Bước 1: Theo dõi GPS

```dart
Geolocator.getPositionStream(
  locationSettings: const LocationSettings(
    accuracy: LocationAccuracy.best,
    distanceFilter: 5,
  ),
);
```

Provider:

```dart
final locationStreamProvider =
    StreamProvider<Position>((ref) {
  return Geolocator.getPositionStream(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 5,
    ),
  );
});
```

---

### Bước 2: Lưu Route hiện tại

Khi solve route:

```dart
class RouteInfo {
  final List<Point> routePoints;
  final List<DirectionStep> directions;
  final double totalDistance;
  final double totalDuration;
}
```

---

### Bước 3: Theo dõi tiến trình

Mỗi lần GPS update:

```dart
currentLocation
```

Tính:

```text
User
 ↓
Polyline
 ↓
Nearest Point
```

ArcGIS Geometry Engine hỗ trợ:

```dart
GeometryEngine.nearestCoordinate(...)
```

hoặc

```dart
GeometryEngine.distanceBetween(...)
```

---

### Bước 4: Phát hiện lệch tuyến

Ví dụ:

```dart
const offRouteThreshold = 30;
```

```dart
final distanceToRoute =
    GeometryEngine.distanceBetween(
      currentLocation,
      nearestPoint,
    );

if (distanceToRoute > offRouteThreshold) {
   // off route
}
```

---

### Bước 5: Re-route

Khi lệch tuyến:

```dart
solveRoute(
  start: currentGps,
  destination: destination,
);
```

vẫn truyền:

```dart
pointBarriers
```

như hiện tại.

Lợi ích:

```text
Vẫn dùng toàn bộ
Incident Avoidance
```

đã có.

---

# Hướng 2: Dùng ArcGIS Navigation SDK Style

Sample Thanh gửi:

```text
navigate-route
navigate-route-with-rerouting
```

dùng:

```dart
RouteTracker
```

và

```dart
RouteTrackerLocationDataSource
```

ArcGIS sẽ tự:

* Theo dõi GPS
* Tính progress
* Xác định maneuver
* Off-route detection
* Re-routing

Ví dụ:

```dart
final routeTracker =
    RouteTracker(
      routeResult,
      0,
      true,
    );
```

---

GPS:

```dart
final locationDataSource =
    SystemLocationDataSource();
```

---

Tracking:

```dart
final trackingStatus =
    await routeTracker.trackLocation(
      location,
    );
```

---

Kiểm tra:

```dart
trackingStatus.destinationStatus
```

```dart
trackingStatus.routeProgress
```

```dart
trackingStatus.remainingDistance
```

```dart
trackingStatus.remainingTime
```

---

Off-route:

```dart
trackingStatus.isOnRoute
```

Nếu:

```dart
false
```

thì:

```dart
reroute()
```

---

## Với Smart Route nên chọn hướng nào?

Mình khuyến nghị:

### Nếu đã có Routing REST API hoàn chỉnh

Tiếp tục:

```text
REST Routing
+
GPS Tracking
+
Custom Navigation
```

vì:

* Ít sửa code cũ
* Tận dụng Incident Barriers hiện tại
* Dễ kiểm soát logic
* Dễ viết báo cáo

### Nếu muốn Navigation chuyên nghiệp

Nghiên cứu:

```text
RouteTracker
```

của ArcGIS.

Khi đó kiến trúc sẽ là:

```text
ArcGIS Route API
      ↓
RouteResult
      ↓
RouteTracker
      ↓
Navigation
      ↓
Re-routing
```

Tuy nhiên trước khi quyết định, mình muốn biết hiện tại Thanh đang dùng:

* **ArcGIS REST API bằng Dio/Http** (gọi endpoint `/solve`)
* hay **ArcGIS Flutter SDK RouteTask / RouteParameters / RouteResult**

vì cách tích hợp Navigation sẽ khác hoàn toàn giữa hai trường hợp này.


====================================================
User Ask: ArcGIS REST API bằng Dio/Http (gọi endpoint /solve)

Chat Response:

Nếu Thanh đang dùng:

```text
Flutter
   ↓
Dio
   ↓
ArcGIS REST API /solve
```

thì mình khuyên **không nên chuyển sang RouteTracker của ArcGIS SDK lúc này**.

Lý do:

* Thanh đã xây dựng hoàn chỉnh:

  * Repository
  * DataSource
  * RouteModel
  * Incident Avoidance (`pointBarriers`)
  * Clean Architecture
* RouteTracker của ArcGIS hoạt động tốt nhất khi route được tạo bởi:

```dart
RouteTask
RouteParameters
RouteResult
```

của ArcGIS SDK.

Trong khi hiện tại Thanh đang nhận về:

```dart
RouteResponseModel
```

từ REST API.

=> Muốn dùng RouteTracker sẽ phải chuyển đổi hoặc viết lại khá nhiều phần.

---

# Kiến trúc phù hợp nhất hiện nay

```text
Navigation Screen
       │
       ▼
Location Stream
       │
       ▼
Navigation Controller
       │
       ├── Current Location
       ├── Current Step
       ├── Remaining Distance
       ├── Remaining Time
       ├── Off Route Detection
       └── Auto Re-routing
                     │
                     ▼
          ArcGIS REST Solve Route
```

---

# Bước 1: Tạo NavigationSession

Sau khi solve route thành công:

```dart
final route = await routingRepository.solveRoute(...);
```

Tạo:

```dart
class NavigationSession {
  final RouteModel route;

  int currentDirectionIndex;

  double remainingDistance;

  double remainingDuration;

  bool isNavigating;

  NavigationSession({
    required this.route,
    this.currentDirectionIndex = 0,
    this.remainingDistance = 0,
    this.remainingDuration = 0,
    this.isNavigating = false,
  });
}
```

---

# Bước 2: GPS Stream

Ví dụ:

```dart
final locationStream =
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 5,
      ),
    );
```

5m cập nhật một lần.

---

# Bước 3: Xác định vị trí trên route

Route hiện tại đã có:

```dart
route.geometry
```

hoặc:

```dart
List<Point>
```

Từ GPS:

```dart
currentPosition
```

tìm điểm gần nhất trên polyline.

Ý tưởng:

```text
GPS
 ↓
Polyline
 ↓
Nearest Point
```

---

# Bước 4: Tính Remaining Distance

Ví dụ route:

```text
A ───── B ───── C ───── D
```

Người dùng đang ở:

```text
A ───── B ── X ── C ───── D
```

Ta tính:

```text
X → C → D
```

Kết quả:

```dart
remainingDistance = 4.2;
```

(km)

---

# Bước 5: ETA

ArcGIS đã trả:

```dart
totalTime
```

Từ progress:

```dart
completedPercent
```

ước lượng:

```dart
remainingTime
```

Hiển thị:

```text
Còn lại:
4.2 km

7 phút

ETA:
08:35
```

---

# Bước 6: Xác định Step hiện tại

ArcGIS directions trả:

```dart
[
  "Đi thẳng 300m",
  "Rẽ phải",
  "Tiếp tục 2km"
]
```

Khi GPS tiến gần maneuver:

```text
distance < 50m
```

chuyển:

```dart
currentDirectionIndex++;
```

UI:

```text
Tiếp tục 300m

Rẽ phải vào Trần Phú
```

---

# Bước 7: Voice Navigation

Rất dễ.

Ví dụ:

```dart
final flutterTts = FlutterTts();

await flutterTts.speak(
  "50 mét nữa rẽ phải",
);
```

Trigger:

```text
distanceToManeuver < 50m
```

---

# Bước 8: Off Route Detection

Đây là phần quan trọng nhất.

Tính khoảng cách:

```text
GPS
 ↓
Route Polyline
```

Nếu:

```dart
distance > 30
```

(mét)

thì:

```dart
isOffRoute = true;
```

---

# Bước 9: Auto Re-routing

Khi:

```dart
isOffRoute == true
```

gọi lại API:

```dart
solveRoute(
  start: currentGps,
  destination: destination,
);
```

vẫn giữ:

```dart
pointBarriers
```

nên route mới tiếp tục tránh:

```sql
status='active'
AND severity IN ('high','medium')
```

Đây chính là điểm khác biệt của Smart Route.

---

# Bước 10: Incident-aware Re-routing (điểm mạnh của đồ án)

Google Maps:

```text
Lệch đường
↓
Tính lại
```

Smart Route:

```text
Lệch đường
↓
Tính lại
↓
Lấy sự cố mới nhất
↓
Tự né sự cố
↓
Route mới
```

---

# Theo mức độ ưu tiên

Mình sẽ làm theo thứ tự:

### Giai đoạn 1

* GPS tracking
* Current location marker
* Remaining distance
* ETA

### Giai đoạn 2

* Current maneuver
* Progress tracking
* Voice navigation

### Giai đoạn 3

* Off-route detection
* Auto re-routing

### Giai đoạn 4

* Re-route khi xuất hiện sự cố mới
* Notification khi route bị ảnh hưởng bởi sự cố

Đối với Smart Route, chỉ cần hoàn thành đến **Giai đoạn 3 (Auto Re-routing)** là module Navigation đã đủ mạnh để đưa vào chuyên đề tốt nghiệp, vì lúc đó hệ thống không chỉ tìm đường mà còn thực hiện điều hướng thời gian thực và tự động tính lại lộ trình khi người dùng đi sai hướng.



