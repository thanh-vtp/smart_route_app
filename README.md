# Smart Route App 🗺️

Ứng dụng di động Flutter cho phép người dùng lập kế hoạch tuyến đường thông minh, tránh sự cố giao thông bằng cách sử dụng ArcGIS Maps và công nghệ định vị địa lý tiên tiến.

## 📋 Mục Lục

- [Tính Năng Chính](#-tính-năng-chính)
- [Phân Tích Thiết Kế Hệ Thống](#-phân-tích-thiết-kế-hệ-thống)
- [Kiến Trúc Dự Án](#-kiến-trúc-dự-án)
- [Yêu Cầu Hệ Thống](#-yêu-cầu-hệ-thống)
- [Cài Đặt & Chạy](#-cài-đặt--chạy)
- [Cấu Trúc Thư Mục](#-cấu-trúc-thư-mục)
- [Công Nghệ Sử Dụng](#-công-nghệ-sử-dụng)
- [Hướng Dẫn Sử Dụng](#-hướng-dẫn-sử-dụng)
- [Tính Năng Nâng Cao](#-tính-năng-nâng-cao)
- [Xử Lý Lỗi & Troubleshooting](#-xử-lý-lỗi--troubleshooting)

---

## ✨ Tính Năng Chính

### 1. **Xác Thực Người Dùng (Authentication)**
- ✅ Đăng nhập với Google Sign-In
- ✅ Quản lý phiên đăng nhập
- ✅ Bảo mật dữ liệu người dùng với Supabase

### 2. **Tính Năng Bản Đồ Tương Tác**
- 🗺️ Xem bản đồ ArcGIS đáp ứng được
- 📍 Hiển thị vị trí hiện tại của người dùng
- 🎨 Chuyển đổi kiểu bản đồ (Street, Satellite, Hybrid)
- 🔍 Tìm kiếm địa chỉ (Geocoding)
- 📍 Lấy thông tin địa chỉ từ tọa độ (Reverse Geocoding)
- 📸 Xem hình ảnh vệ tinh chi tiết

### 3. **Smart Routing - Tránh Sự Cố Giao Thông**
- 🚗 Tính toán tuyến đường thông minh
- 🛑 Tự động phát hiện incidents (tai nạn, ngập lụt, công trường)
- 📊 So sánh nhiều tuyến đường thay thế
- ⏱️ Hiển thị thời gian tiết kiệm
- 📈 Weighted cost function dựa trên số lượng sự cố
- 🔄 Tìm tuyến đường thay thế bằng perpendicular waypoint

### 4. **Thông Tin Vị Trí Nâng Cao**
- 🏢 Xem địa điểm lân cận
- 📝 Thông tin chi tiết về vị trí (tên đường, khu vực, quận/huyện)
- 🖼️ Hình ảnh vệ tinh World Imagery từ ArcGIS
- 📌 Quản lý danh sách địa chỉ yêu thích

### 5. **Cài Đặt & Tùy Chỉnh**
- 🎨 Tùy chỉnh giao diện (Settings page)
- 🔔 Quản lý thông báo
- 🌐 Hỗ trợ đa ngôn ngữ (chuẩn bị)
- 📱 Device preview cho testing đa thiết bị

---

## 🏗️ Kiến Trúc Dự Án

Dự án sử dụng **Clean Architecture** với Riverpod cho state management:

```
lib/
├── main.dart                 # Entry point
├── core/                     # Lớp cốt lõi chia sẻ
│   ├── app/
│   │   ├── app.dart         # App configuration
│   │   ├── router.dart      # Navigation routes
│   │   └── init.dart        # App initialization
│   ├── errors/              # Exception handling
│   ├── network/             # Network utilities
│   ├── resources/           # Constants, themes
│   ├── ui/                  # Shared UI components
│   ├── uscases/             # Shared use cases
│   └── utils/               # Utilities
│
└── features/                # Business features
    ├── auth/                # Authentication feature
    │   ├── data/
    │   │   ├── datasources/
    │   │   ├── models/
    │   │   └── repositories/
    │   ├── domain/
    │   │   ├── entities/
    │   │   ├── repositories/
    │   │   └── usecases/
    │   └── presentation/
    │       ├── pages/
    │       ├── providers/
    │       └── states/
    │
    ├── map/                 # Map & Routing feature
    │   ├── data/
    │   │   ├── datasources/
    │   │   ├── models/
    │   │   └── repositories/
    │   ├── domain/
    │   │   ├── entities/
    │   │   ├── repositories/
    │   │   └── usecases/
    │   └── presentation/
    │       ├── helpers/
    │       ├── logics/
    │       ├── models/
    │       ├── pages/
    │       ├── providers/
    │       ├── widgets/
    │       └── utils/
    │
    └── main/                # Main home feature
        └── presentation/
            ├── pages/
            └── providers/
```

### Luồng Dữ Liệu
```
UI Layer (Pages/Widgets)
    ↓
Presentation Layer (Providers/Logics)
    ↓
Domain Layer (Use Cases)
    ↓
Data Layer (Repositories/Data Sources)
    ↓
External Services (ArcGIS, Supabase, Google)
```

---

## 📦 Yêu Cầu Hệ Thống

### Phần Mềm
- **Flutter**: ^3.9.2
- **Dart**: ^3.9.2
- **Android**: API 21+ (Android 5.0)
- **iOS**: iOS 12.0+
- **Windows/Linux/Web**: Hỗ trợ đầy đủ

### Tài Khoản & API Keys
1. **ArcGIS Developer Account**
   - Đăng ký tại https://developers.arcgis.com
   - Lấy API Key
   - Cấu hình trong `.env`

2. **Google Cloud Project**
   - Bật Google Sign-In API
   - Tạo OAuth 2.0 Client IDs
   - Cấu hình trong Android/iOS config

3. **Supabase Project**
   - Tạo project tại https://supabase.com
   - Lấy URL và API Key
   - Cấu hình trong `.env`

---

## 🚀 Cài Đặt & Chạy

### 1. Clone Repository
```bash
git clone https://github.com/yourusername/smart_route_app.git
cd smart_route_app
```

### 2. Cài Đặt Dependencies
```bash
flutter pub get
```

### 3. Tạo File `.env`
```bash
# .env (tại root của project)
ARCGIS_API_KEY=your_arcgis_api_key_here
SUPABASE_URL=your_supabase_url_here
SUPABASE_ANON_KEY=your_supabase_anon_key_here
GOOGLE_CLIENT_ID=your_google_client_id_here
```

### 4. Tạo Generated Files
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 5. Chạy Ứng Dụng

**Android:**
```bash
flutter run -d android
```

**iOS:**
```bash
flutter run -d ios
```

**Web:**
```bash
flutter run -d web
```

**Windows:**
```bash
flutter run -d windows
```

---

## 📁 Cấu Trúc Thư Mục Chi Tiết

### `assets/`
```
assets/
├── icons/              # Icon assets
└── images/
    └── markers/        # Map marker images
```

### `lib/features/auth/`
**Quản lý xác thực người dùng**
- Đăng nhập/Đăng xuất
- Quản lý session
- Integration với Google Sign-In & Supabase

### `lib/features/map/`
**Tính năng chính liên quan bản đồ**
- **pages/**: Map Page, Direction Page, ArcGIS Demo Page
- **providers/**: Riverpod providers quản lý state
  - `base_map_style_providers.dart` - Kiểu bản đồ
  - `connectivity_provider.dart` - Kiểm tra kết nối mạng
  - `feature_layer_providers.dart` - Lớp incidents
- **logics/**: Business logic
  - `map_interaction_logic.dart` - Xử lý tương tác bản đồ
  - `smart_routing_logic.dart` - Thuật toán smart routing
- **widgets/**: Reusable widgets
  - `location_picker_map_widget.dart`
  - `location_info_bottom_sheet.dart`
  - `route_info_banner.dart`

### `lib/features/main/`
**Trang chủ & điều hướng chính**
- Main page layout
- Navigation drawer
- Settings page

### `lib/core/`
**Lớp chia sẻ toàn ứng dụng**
- `app/` - Cấu hình ứng dụng chính
- `errors/` - Xử lý lỗi custom
- `network/` - HTTP client, interceptors
- `resources/` - Constants, themes, colors
- `ui/` - Widgets chia sẻ (buttons, dialogs, etc.)
- `utils/` - Helper functions

---

## 🛠️ Công Nghệ Sử Dụng

### State Management
- **Riverpod** & **Hooks Riverpod**: State management reactive
- **Riverpod Annotation**: Generator cho providers
- **Flutter Hooks**: Reusable stateful logic

### Maps & Location
- **ArcGIS Maps**: Map rendering, geocoding, routing
- **Geolocator**: Lấy vị trí hiện tại
- **Location**: Background location services

### Authentication & Backend
- **Google Sign-In**: OAuth 2.0 authentication
- **Supabase**: Backend, database, authentication
- **Supabase Flutter**: Supabase integration cho Flutter

### Data Management
- **Freezed**: Code generation cho models
- **Json Serializable**: JSON serialization
- **Equatable**: Value equality
- **FPDart**: Functional programming utilities

### UI & Navigation
- **Go Router**: Navigation & routing
- **Flutter Hooks**: Stateful logic
- **Device Preview**: Multi-device preview
- **Cached Network Image**: Image caching

### Utilities
- **HTTP**: HTTP requests
- **UUID**: Unique identifier generation
- **Shared Preferences**: Local storage
- **Connectivity Plus**: Network connectivity
- **Flutter Dotenv**: Environment variables

### Testing & Development
- **Mockito**: Mocking library
- **Build Runner**: Code generation
- **Custom Lint**: Linting rules
- **Flutter Lints**: Lint recommendations

---

## 📖 Hướng Dẫn Sử Dụng

### Đăng Nhập
1. Mở ứng dụng
2. Nhấn **"Sign in with Google"**
3. Chọn tài khoản Google của bạn
4. Cấp quyền truy cập

### Sử Dụng Bản Đồ
1. Sau khi đăng nhập, bạn sẽ thấy bản đồ
2. **Để xem vị trí hiện tại**: Nhấn nút location icon
3. **Để thay đổi kiểu bản đồ**: Nhấn nút layer picker
4. **Để tìm kiếm địa chỉ**: Nhấn nút search

### Tính Toán Tuyến Đường
1. Nhấn nút **"Tính đường đi"**
2. Thêm ít nhất 2 điểm (Start → End)
3. Chọn tuyến đường từ kết quả
4. Bật **"Tránh sự cố"** để tìm tuyến đường thông minh
5. Xem tuyến đường trên bản đồ

### ArcGIS Demo
1. Từ Main Page, nhấn **FAB xanh** hoặc vào **avatar → ArcGIS Demo**
2. Thử các tính năng:
   - **Geocoding**: Tìm kiếm địa chỉ
   - **Reverse Geocoding**: Xem thông tin từ tọa độ
   - **Route Planning**: Tính toán đường đi
   - **Imagery**: Xem hình ảnh vệ tinh

---

## 🚀 Tính Năng Nâng Cao

### Smart Routing Algorithm

**Thuật toán tránh sự cố giao thông:**

1. **Cost Function (A* inspired)**
   ```
   Cost = Thời gian thực (phút) + (Số incidents × Penalty)
   Penalty = 10 phút/incident
   ```

2. **Phát Hiện Incidents Ảnh Hưởng**
   - Bán kính: 100 mét
   - Sử dụng Haversine formula để tính khoảng cách
   - Point-to-segment distance cho độ chính xác cao

3. **Tìm Tuyến Đường Thay Thế**
   - Tính perpendicular waypoint từ midpoint
   - Thử khoảng cách: 300m, 500m, 800m
   - Thử cả 2 hướng (trái/phải)
   - Chọn route có ít incidents nhất

4. **So Sánh Routes**
   - So sánh tất cả tuyến đường dựa trên cost
   - Chọn tuyến đường tốt nhất
   - Hiển thị tiết kiệm thời gian

### Reverse Geocoding
- Lấy thông tin địa chỉ chi tiết từ tọa độ
- Thông tin: tên đường, khu vực, quận/huyện
- Hình ảnh vệ tinh tự động

### Nearby Places
- Xem địa điểm lân cận
- Filtrering theo loại địa điểm
- Khoảng cách và hướng

---

## ⚙️ Xử Lý Lỗi & Troubleshooting

### 1. Connection Issues
```
SocketException: Connection attempt cancelled
ClientException: Client is already closed
```
**Giải pháp:**
- Kiểm tra kết nối internet
- Thử test connection
- Restart ứng dụng
- Sử dụng VPN nếu bị chặn

### 2. Geocoding Errors
```
"Lỗi khi geocode địa chỉ"
```
**Giải pháp:**
- Kiểm tra ArcGIS API Key
- Thử với địa chỉ đơn giản hơn
- Kiểm tra kết nối internet

### 3. Route Planning Failures
```
"Không tìm thấy đường đi"
```
**Giải pháp:**
- Đảm bảo có ít nhất 2 điểm
- Kiểm tra tọa độ có hợp lệ
- Thử với các điểm gần nhau hơn

### 4. DNS Lookup Failures
```
Failed host lookup: 'basemapstyles-api.arcgis.com'
```
**Giải pháp:**
- Sử dụng DNS công cộng (8.8.8.8, 1.1.1.1)
- Kiểm tra tường lửa/proxy
- Sử dụng VPN

### 5. Image Loading Issues
```
Unable to load asset imagery
```
**Giải pháp:**
- `flutter clean && flutter pub get`
- Restart IDE
- Rebuild project

### 6. Building & Running Issues
```bash
# Clean project
flutter clean

# Regenerate files
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

# Run
flutter run
```

---

## 📊 Thông Tin Chi Tiết Các Tính Năng

### Authentication Flow
```
Splash Screen
    ↓
Check Auth State (Supabase)
    ↓
If Logged In → Main Page
If Not → Login Page
    ↓
Google Sign-In
    ↓
Supabase Auth
    ↓
Main Page
```

### Map Interaction Flow
```
User Interaction
    ↓
Map Interaction Logic
    ↓
Update Map State (Riverpod Provider)
    ↓
Update UI
```

### Smart Routing Flow
```
User enables "Smart Routing"
    ↓
Calculate Base Route
    ↓
Fetch Incidents Data
    ↓
Detect Affected Incidents (100m radius)
    ↓
Find Alternative Routes
    ↓
Calculate Cost for Each Route
    ↓
Select Best Route
    ↓
Display Route + Time Saved
```

---

## 🔐 Bảo Mật

- ✅ Secure storage cho sensitive data (Flutter Secure Storage)
- ✅ Environment variables cho API keys (.env)
- ✅ Google Sign-In authentication
- ✅ Supabase Row Level Security
- ✅ HTTPS for all API calls

---

## 📝 Environment Variables (.env)

```env
# ArcGIS
ARCGIS_API_KEY=your_api_key

# Supabase
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your_anon_key

# Google
GOOGLE_CLIENT_ID=your_google_client_id
```

---

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 👥 Authors

- **Thanh** - Initial work

---

## 📞 Support & Contact

- **Issues**: GitHub Issues
- **Documentation**: [SMART_ROUTING.md](docs/SMART_ROUTING.md), [ARCGIS_DEMO_GUIDE.md](ARCGIS_DEMO_GUIDE.md)
- **ArcGIS Docs**: https://developers.arcgis.com
- **Flutter Docs**: https://flutter.dev

---

## 📚 Tài Liệu Thêm

- [Smart Routing Algorithm](docs/SMART_ROUTING.md) - Chi tiết thuật toán
- [ArcGIS Demo Guide](ARCGIS_DEMO_GUIDE.md) - Hướng dẫn demo
- [Refactoring Notes](lib/features/map/REFACTORING.md) - Ghi chú refactoring
- [ArcGIS Documentation](lib/features/map/README_ARCGIS.md) - Tài liệu ArcGIS

---

## 📊 Phân Tích Thiết Kế Hệ Thống

### **PHÂN TÍCH**

#### 1. 🎯 Sơ Đồ Use Case

Sơ đồ Use Case xác định các actors (người dùng) và các tương tác của họ với hệ thống. Người dùng chính là Traveler (du khách/lái xe) có thể thực hiện các use case như: đăng nhập, tìm kiếm địa chỉ, tính tuyến đường, sử dụng smart routing để tránh incidents, xem thông tin vị trí, thay đổi kiểu bản đồ, cài đặt và đăng xuất.

**Các Use Case Chính:**

| Use Case | Mô Tả | Pre-condition | Post-condition |
|----------|-------|---------------|-----------------|
| UC1: Sign In | Đăng nhập bằng Google | Không đăng nhập | Đã xác thực, vào Main Page |
| UC2: Search Location | Tìm kiếm địa chỉ | Đã đăng nhập | Hiện kết quả geocoding |
| UC3: Calculate Route | Tính tuyến đường | Có ≥2 điểm | Hiện route + thông tin |
| UC4: Smart Routing | Tránh sự cố giao thông | Route tính xong | Hiện route thay thế + tiết kiệm |
| UC5: View Location Info | Xem thông tin vị trí | Chọn vị trí trên map | Hiện bottom sheet + hình ảnh |
| UC6: Change Map View | Thay đổi kiểu bản đồ | Đã mở bản đồ | Hiện bản đồ mới |
| UC7: View Settings | Xem/quản lý cài đặt | Đã đăng nhập | Hiện Settings page |
| UC8: Logout | Đăng xuất | Đã đăng nhập | Quay lại Login page |

---

#### 2. 📦 Mô Hình BFD (Business Function Decomposition)

BFD phân nhóm các chức năng thành 7 module logic chính:

**1. Authentication & User Management**
- Sign In (Google OAuth 2.0)
- Sign Out
- Manage User Session
- User Profile Management

**2. Location & Geocoding Services**
- Get Current Location (GPS)
- Search Address (Geocoding)
- Reverse Geocoding (Coordinate → Address)
- Fetch Location Details
- Find Nearby Places
- Fetch Satellite Imagery

**3. Map Interaction & Visualization**
- Initialize Map View
- Display User Location
- Pan/Zoom Map
- Switch Map Styles (Street/Satellite/Hybrid)
- Display Graphics/Markers
- Handle Map Taps/Clicks
- Show Location Info Bottom Sheet

**4. Route Planning & Navigation**
- Add/Remove Waypoints
- Calculate Route (Basic)
- Display Route on Map
- Show Route Info (Distance, Duration)
- Manage Route List

**5. Smart Routing Engine** ⭐
- Fetch Real-time Incident Data
- Detect Affected Incidents (100m radius)
- Calculate Cost Function
- Find Alternative Routes (Perpendicular Waypoint)
- Compare Multiple Routes
- Select Optimal Route
- Display Time Saved

**6. Data Persistence & Cache**
- Save Favorite Locations
- Save Search History
- Cache Images (Network Images)
- Local Storage (Shared Preferences)
- Database Operations (Supabase)

**7. System & Settings Management**
- Network Connectivity Check
- Manage User Preferences
- Handle Notifications
- Error Handling & Logging
- Device Permission Management

**Mapping BFD → Codebase:**

| BFD Module | Code Location | Thành Phần Chính |
|------------|---------------|-----------------|
| Authentication | `features/auth/` | LoginPage, AuthProvider, AuthRepository |
| Location Services | `features/map/data/datasources/` | GeocodingDataSource, LocationDataSource |
| Map Interaction | `features/map/presentation/` | MapPage, MapInteractionLogic, MapWidgets |
| Route Planning | `features/map/domain/usecases/` | CalculateRouteUseCase, RouteRepository |
| Smart Routing | `features/map/presentation/logics/` | SmartRoutingLogic, SmartRoutingProvider |
| Data Persistence | `lib/core/`, `shared_preferences` | Network, Cache, LocalStorage |
| Settings | `features/main/presentation/` | SettingsPage, PreferencesProvider |

---

#### 3. 📈 Mô Hình DFD (Data Flow Diagram) - Level 1

DFD mô tả luồng dữ liệu qua hệ thống. Hệ thống nhận input từ người dùng và giao tiếp với 3 external services chính: ArcGIS (maps/routing/geocoding), Google OAuth (authentication), và Supabase (backend).

**Main Data Flows:**
- **Authentication Data**: OAuth token từ Google → Supabase → Local storage
- **Location Data**: GPS coordinates, search queries → ArcGIS APIs → User interface
- **Route Data**: Waypoints → ArcGIS Routing API + Incident Database → Smart Routing Logic → Route results
- **Incident Data**: Real-time incidents → Detect affected routes → Cost calculation

**Các mức DFD:**
- **Level 0**: Context diagram - Hệ thống nhận input từ user, kết nối 3 services
- **Level 1**: 4 main processes - Auth, Location Services, Map Interaction, Smart Routing
- **Level 2**: Chi tiết hóa các process con, luồng dữ liệu giữa các entities

---

### **THIẾT KẾ**

#### 1. 🎨 Thiết Kế Giao Diện (5 Màn Hình Chính)

##### **Login Screen**
- OAuth Sign-In buttons (Google, Apple)
- Branding & welcome message
- Terms of Service link
- Loading indicator

##### **Main Map Screen**
- Full-screen ArcGIS map
- Floating action buttons: Zoom, Pan, Search, Map Style, Location, Settings
- Bottom search bar for location input
- Tap map to show location info

##### **Direction Screen**
- Start point input (current location or search)
- End point input (search)
- Recent locations quick select
- Calculate button
- Post-calculation: Show primary + alternative routes
- Smart routing toggle to enable incident avoidance
- Route info display: distance, duration, time saved

##### **Location Info Bottom Sheet**
- Address details (street, district, city, postal code)
- Satellite imagery display
- Nearby places list (restaurants, hospitals, parks, etc.)
- Quick actions: Add to route, Add to favorites, Share location

##### **Settings Screen**
- Account: Profile, Privacy & Security
- Preferences: Notifications, Theme, Language
- Routing Options: Avoid incidents, Prefer highways, Toll free roads
- About: Version info, Help & Support
- Sign Out button

---

#### 2. ⚙️ Thiết Kế Xử Lý (Business Logic Flows)

##### **Authentication Flow**
1. App checks local session/token
2. If valid → go to Main Page, else → show Login Page
3. User taps Google Sign In
4. Google OAuth dialog opens
5. User selects account → get access token
6. Send token to Supabase → get session token + user info
7. Save to local storage
8. Update auth state (Riverpod)
9. Navigate to Main Page

##### **Smart Routing Flow** (7-step process)
1. Validate input (coordinates, internet)
2. Calculate base route (ArcGIS Route API)
3. Fetch incident data from database
4. Detect affected incidents (100m radius using Haversine formula)
5. Calculate cost function: `Cost = Time(min) + Incidents×10`
6. Find alternative routes (perpendicular waypoint at 300m, 500m, 800m)
7. Select optimal route (min cost) and display time saved

##### **Location Search & Reverse Geocoding Flow**
- **Search**: User enters address → Call Geocoding API → Return top 5 results → User selects → Fetch details (imagery, nearby places)
- **Tap Map**: User taps location → Get coordinates → Call Reverse Geocoding → Get address → Fetch location details → Show bottom sheet

---

#### 3. 📊 Data Model & Relationships

```
User (1) ──── (Many) Route
User (1) ──── (Many) Favorite Route
Route (1) ──── (Many) Waypoint
Incident (Independent) → Affects Routes via distance check
```

**Key Entities:**
- **User**: id, email, name, profileImage, preferences
- **Route**: id, userId, startPoint, endPoint, distance, duration, path(JSON), createdAt
- **Waypoint**: id, routeId, latitude, longitude, sequence, address
- **Incident**: id, type, latitude, longitude, description, severity, timestamp
- **FavoriteRoute**: id, userId, routeId, name, savedAt

---

**Phần PHÂN TÍCH THIẾT KẾ HỆ THỐNG đã được bổ sung hoàn chỉnh!** ✅

---

## 📚 Tài Liệu Chi Tiết Features

- [Authentication Flow Explained](docs/AUTH_FLOW_EXPLAINED.md) ⭐ - Giải thích chi tiết luồng đăng nhập Google OAuth, lưu Supabase, quản lý phiên
- [Smart Routing Algorithm](docs/SMART_ROUTING.md) - Chi tiết thuật toán tránh sự cố
- [ArcGIS Demo Guide](ARCGIS_DEMO_GUIDE.md) - Hướng dẫn demo các tính năng
- [Refactoring Notes](lib/features/map/REFACTORING.md) - Ghi chú refactoring
- [ArcGIS Documentation](lib/features/map/README_ARCGIS.md) - Tài liệu ArcGIS

---

**Happy Routing! 🚀**
