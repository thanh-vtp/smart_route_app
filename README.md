# 🗺️ Smart Route App

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.9.2-0175C2?logo=dart)
![ArcGIS](https://img.shields.io/badge/ArcGIS-200.8.0-2C7AC3)
![Supabase](https://img.shields.io/badge/Supabase-2.10.3-3ECF8E?logo=supabase)
![License](https://img.shields.io/badge/License-Private-red)

**Ứng dụng định tuyến thông minh với khả năng tránh sự cố giao thông động**

[Tính năng](#-tính-năng) • [Công nghệ](#-công-nghệ) • [Cài đặt](#-cài-đặt) •
[Sử dụng](#-sử-dụng) • [Đóng góp](#-đóng-góp)

</div>

---

## 📖 Giới thiệu

**Smart Route App** là một ứng dụng di động định tuyến thông minh được phát
triển bằng Flutter, tích hợp **ArcGIS Maps SDK** và **Supabase** để cung cấp
trải nghiệm điều hướng với khả năng:

- 🚦 **Tránh sự cố giao thông động** - Tự động phát hiện và tránh các điểm tắc
  đường, ngập nước, tai nạn
- 🗺️ **Bản đồ 2D/3D** - Chuyển đổi linh hoạt giữa chế độ xem 2D và 3D
- 📍 **Định vị GPS thời gian thực** - Theo dõi vị trí người dùng chính xác
- 🧭 **Dẫn đường từng bước** - Hướng dẫn rẽ chi tiết bằng tiếng Việt
- 📊 **Phân cụm sự cố thông minh** - Sử dụng thuật toán clustering để nhóm và
  hiển thị sự cố
- 🔔 **Thông báo thời gian thực** - Cảnh báo sự cố mới và mật độ tắc đường cao
- 👤 **Xác thực người dùng** - Đăng nhập bằng Google và quản lý profile

### 🎯 Mục tiêu phát triển

Dự án này được phát triển như một phần của **Chuyên đề tốt nghiệp** với mục
tiêu:

1. Xây dựng hệ thống định tuyến tránh sự cố giao thông động
2. Áp dụng các kỹ thuật phân cụm dữ liệu không gian (Spatial Clustering)
3. Tích hợp GIS và công nghệ bản đồ hiện đại
4. Phát triển ứng dụng di động đa nền tảng với Flutter

---

## ✨ Tính năng

### 🗺️ Bản đồ & Điều hướng

- **Bản đồ 2D/3D**: Chuyển đổi mượt mà giữa chế độ xem 2D và 3D với ArcGIS
- **Nhiều kiểu bản đồ**: Streets, Satellite, Topographic, Dark Mode
- **Định tuyến thông minh**: Tính toán tuyến đường tối ưu tránh sự cố
- **Turn-by-Turn Navigation**: Hướng dẫn rẽ từng bước bằng tiếng Việt
- **GPS Tracking**: Theo dõi vị trí người dùng thời gian thực
- **Recenter Location**: Tự động căn giữa bản đồ theo vị trí hiện tại

### 🚦 Quản lý sự cố

- **Báo cáo sự cố**: Người dùng có thể báo cáo các loại sự cố:
  - 🚧 Tắc đường
  - 🌊 Ngập nước
  - 🚗 Tai nạn giao thông
  - 🏗️ Thi công đường
  - ⚠️ Các sự cố khác
- **Phân loại mức độ nghiêm trọng**: Thấp, Trung bình, Cao
- **Cập nhật realtime**: Sự cố được đồng bộ tức thì qua Supabase
- **Xác minh sự cố**: Người dùng có thể xác nhận/báo cáo sai sự cố

### 📊 Phân cụm thông minh

- **Spatial Clustering**: Nhóm các sự cố gần nhau thành cluster
- **Hiển thị mật độ**: Màu sắc biểu thị mức độ tập trung sự cố
- **Tối ưu hiệu suất**: Giảm số lượng marker trên bản đồ khi zoom out

### 🔔 Thông báo

- **Push Notification**: Thông báo Firebase Cloud Messaging
- **Cảnh báo sự cố**: Thông báo khi có sự cố mới gần vị trí người dùng
- **Cảnh báo mật độ**: Thông báo khi vào khu vực có mật độ sự cố cao
- **Cron Job tự động**: Chạy định kỳ kiểm tra và gửi thông báo

### 👤 Xác thực & Profile

- **Google Sign-In**: Đăng nhập nhanh chóng bằng tài khoản Google
- **Supabase Auth**: Quản lý session an toàn
- **User Profile**: Xem và chỉnh sửa thông tin cá nhân
- **Lịch sử hoạt động**: Theo dõi các sự cố đã báo cáo

### 📈 Phân tích & Thống kê

- **Firebase Analytics**: Theo dõi hành vi người dùng
- **Crashlytics**: Ghi nhận và theo dõi lỗi ứng dụng
- **Biểu đồ thống kê**: Hiển thị xu hướng sự cố theo thời gian

---

## 🛠️ Công nghệ

### Frontend

- **Flutter 3.9.2** - Framework đa nền tảng
- **Dart 3.9.2** - Ngôn ngữ lập trình
- **Riverpod 2.6.1** - State management
- **Hooks Riverpod** - Reactive programming
- **Go Router 16.2.4** - Điều hướng ứng dụng
- **Freezed** - Code generation cho immutable classes

### Maps & GIS

- **ArcGIS Maps SDK 200.8.0** - Bản đồ và phân tích không gian
- **ArcGIS Routing API** - Định tuyến thông minh
- **ArcGIS Toolkit** - Công cụ bản đồ bổ sung
- **Geolocator** - Quản lý GPS và vị trí

### Backend & Database

- **Supabase 2.10.3** - Backend-as-a-Service
  - PostgreSQL Database
  - Realtime Subscriptions
  - Authentication
  - Storage
  - Edge Functions
- **Supabase Cron Jobs** - Tác vụ định kỳ

### Authentication

- **Google Sign-In 7.2.0** - Đăng nhập Google
- **Supabase Auth** - Quản lý xác thực

### Notifications

- **Firebase Cloud Messaging 16.1.3** - Push notifications
- **Flutter Local Notifications 20.1.0** - Local notifications

### Analytics & Monitoring

- **Firebase Analytics 12.1.0** - Phân tích người dùng
- **Firebase Crashlytics 5.0.6** - Theo dõi lỗi

### UI & UX

- **Google Fonts 8.1.0** - Typography
- **Cached Network Image 3.4.1** - Tải và cache hình ảnh
- **Shimmer 3.0.0** - Loading effects
- **FL Chart 1.2.0** - Biểu đồ và đồ thị

### Architecture & Patterns

- **Clean Architecture** - Phân tách layers rõ ràng
- **Facade Pattern** - Đơn giản hóa API phức tạp
- **Factory Pattern** - Tạo objects nhất quán
- **Repository Pattern** - Trừu tượng hóa data source
- **Dependency Injection** - Loose coupling

---

## 📋 Yêu cầu hệ thống

### Phát triển

- **Flutter SDK**: 3.9.2 hoặc mới hơn
- **Dart SDK**: 3.9.2 hoặc mới hơn
- **Android Studio** hoặc **VS Code**
- **Git**
- **Node.js** (cho Supabase CLI)

### Android

- Android API Level 21+ (Android 5.0 Lollipop)
- Android SDK Build Tools
- Google Play Services

### iOS (chưa test đầy đủ)

- iOS 12.0 trở lên
- Xcode 14+
- CocoaPods

---

## 🚀 Cài đặt

### 1. Clone repository

```bash
git clone https://github.com/your-username/smart_route_app.git
cd smart_route_app
```

### 2. Cài đặt dependencies

```bash
flutter pub get
```

### 3. Cấu hình biến môi trường

Tạo file `.env` từ file mẫu:

```bash
cp .env.example .env
```

Mở file `.env` và điền các thông tin cần thiết:

```env
# Supabase Configuration
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-supabase-anon-key

# ArcGIS Configuration
ARCGIS_API_KEY=your-arcgis-api-key

# Google Sign-In Configuration
GOOGLE_CLIENT_ID_WEB=your-web-client-id.apps.googleusercontent.com
GOOGLE_CLIENT_ID_ANDROID=your-android-client-id.apps.googleusercontent.com
GOOGLE_CLIENT_ID_IOS=your-ios-client-id.apps.googleusercontent.com
```

#### 📝 Hướng dẫn lấy API Keys

**Supabase:**

1. Truy cập [supabase.com](https://supabase.com)
2. Tạo project mới hoặc chọn project hiện có
3. Vào **Settings** > **API**
4. Copy `Project URL` và `anon public` key

**ArcGIS:**

1. Truy cập [developers.arcgis.com](https://developers.arcgis.com)
2. Đăng ký tài khoản miễn phí
3. Tạo API Key tại **Dashboard** > **API Keys**
4. Bật các dịch vụ: Basemaps, Routing, Geocoding

**Google Sign-In:**

1. Truy cập [console.cloud.google.com](https://console.cloud.google.com)
2. Tạo project mới hoặc chọn project hiện có
3. Bật **Google+ API**
4. Tạo OAuth 2.0 credentials cho Web, Android, iOS
5. Copy các Client ID tương ứng

### 4. Cài đặt ArcGIS Core SDK

```bash
dart run arcgis_maps install
```

### 5. Generate code (Build Runner)

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 6. Generate app icon

```bash
dart run flutter_launcher_icons
```

### 7. Generate splash screen

```bash
dart run flutter_native_splash:create
```

---

## 🎮 Sử dụng

### Chạy ứng dụng (Development)

```bash
flutter run --dart-define-from-file=.env
```

### Chạy trên device cụ thể

```bash
# List devices
flutter devices

# Run on specific device
flutter run -d <device-id> --dart-define-from-file=.env
```

### Build APK (Debug)

```bash
flutter build apk --debug
```

### Build APK (Release)

```bash
flutter build apk --release
```

### Cài đặt APK vào thiết bị

```bash
flutter install
```

---

## 📁 Cấu trúc dự án

```
smart_route_app/
├── android/                      # Android native code
├── ios/                          # iOS native code
├── assets/                       # Assets (icons, images)
│   ├── icons/                    # App icons và incident icons
│   └── images/                   # Hình ảnh markers
├── lib/
│   ├── core/                     # Core functionality
│   │   ├── app/                  # App initialization
│   │   ├── common/               # Common utilities & map logic
│   │   │   ├── map/              # ArcGIS map management
│   │   │   │   ├── controller/   # Native controller wrappers
│   │   │   │   ├── engine/       # Map engine (2D/3D)
│   │   │   │   ├── facade/       # Facade pattern API
│   │   │   │   ├── factories/    # Object factories
│   │   │   │   ├── interactions/ # User interactions
│   │   │   │   ├── location/     # GPS & location
│   │   │   │   ├── overlays/     # Graphics overlays
│   │   │   │   ├── symbols/      # Symbol factory & cache
│   │   │   │   └── state/        # State management
│   │   │   └── provider/         # Shared providers
│   │   └── network/              # Network utilities
│   ├── features/                 # Feature modules
│   │   ├── auth/                 # Authentication
│   │   ├── incident/             # Incident management
│   │   ├── navigation/           # Routing & navigation
│   │   ├── cluster/              # Spatial clustering
│   │   ├── notification/         # Push notifications
│   │   ├── profile/              # User profile
│   │   └── analytics/            # Analytics & stats
│   ├── shared/                   # Shared widgets & utilities
│   └── main.dart                 # App entry point
├── supabase/                     # Supabase configuration
│   ├── functions/                # Edge Functions
│   ├── migrations/               # Database migrations
│   └── config.toml               # Supabase config
├── test/                         # Unit & widget tests
├── .env.example                  # Environment variables template
├── pubspec.yaml                  # Dependencies
├── dart_run_builder.md           # Build commands reference
└── README.md                     # This file
```

---

## 🏗️ Kiến trúc

Dự án sử dụng **Clean Architecture** với 3 layers chính:

### 1. Presentation Layer

- **Widgets**: UI components
- **Providers/Notifiers**: State management với Riverpod
- **State classes**: Freezed models cho UI state

### 2. Domain Layer

- **Entities**: Business objects
- **Use Cases**: Business logic
- **Repository Interfaces**: Contracts cho data layer

### 3. Data Layer

- **Models**: Data transfer objects
- **Repositories**: Implementation của interfaces
- **Data Sources**: Remote (API) và Local (Cache)

### Design Patterns

- ✅ **Facade Pattern**: Đơn giản hóa ArcGIS SDK API
- ✅ **Factory Pattern**: Tạo map objects nhất quán
- ✅ **Repository Pattern**: Trừu tượng hóa data source
- ✅ **Dependency Injection**: Loose coupling với Riverpod
- ✅ **Observer Pattern**: Reactive programming

---

## 🗄️ Database (Supabase)

### Tables chính

- **users**: Thông tin người dùng
- **incidents**: Sự cố giao thông
- **incident_verifications**: Xác minh sự cố
- **user_locations**: Lịch sử vị trí người dùng
- **notifications**: Thông báo
- **fcm_tokens**: Firebase tokens

### Supabase Local Development

```bash
# Link project với database local
npx supabase link

# Pull schema từ database local
npx supabase db pull

# Apply migrations
npx supabase db reset

# Dump data từ Remote về Local
npx supabase db dump --data-only -f supabase/seed.sql
```

### Sync Local → Remote

```bash
# Bước 1: Tạo migration file
npx supabase db diff -f ten_thay_doi

# Bước 2: Push lên Remote
npx supabase db push
```

---

## 🔔 Push Notifications

Ứng dụng sử dụng **Firebase Cloud Messaging** kết hợp với **Supabase Edge
Functions** và **Cron Jobs**.

### Flow

1. User mở app → Đăng ký FCM token → Lưu vào Supabase
2. Cron Job chạy định kỳ (mỗi 15 phút)
3. Edge Function kiểm tra cluster mật độ cao
4. Gửi notification cho users trong vùng ảnh hưởng

### Cấu hình Cron Job

Xem file `sql_edit.md` để biết cách cấu hình Postgres Cron Job.

---

## 🧪 Testing

### Chạy unit tests

```bash
flutter test
```

### Chạy integration tests

```bash
flutter test integration_test
```

### Code coverage

```bash
flutter test --coverage
```

---

## 🤝 Đóng góp

Dự án này hiện đang ở giai đoạn **Chuyên đề tốt nghiệp**. Nếu bạn muốn đóng góp
hoặc hợp tác phát triển, vui lòng:

### Fork & Pull Request

1. Fork repository này
2. Tạo branch mới: `git checkout -b feature/amazing-feature`
3. Commit changes: `git commit -m 'Add amazing feature'`
4. Push to branch: `git push origin feature/amazing-feature`
5. Mở Pull Request

### Báo cáo lỗi

Nếu bạn phát hiện lỗi, vui lòng tạo Issue với thông tin:

- Mô tả lỗi
- Các bước tái hiện
- Expected vs Actual behavior
- Screenshots (nếu có)
- Device & OS version

### Đề xuất tính năng

Có ý tưởng hay? Tạo Issue với label `enhancement`!

---

## 📬 Liên hệ

**Võ Trần Phương Thanh**

- 📧 Email: [thanhvo.081102@gmail.com](mailto:thanhvo.081102@gmail.com)
- 🐙 GitHub: [thanh-vtp](https://github.com/thanh-vtp)

### Hợp tác & Phát triển

Tôi đang tìm kiếm cơ hội:

- 🚀 Phát triển thêm tính năng mới
- 🤝 Hợp tác dự án IoT/GIS
- 💼 Cơ hội việc làm trong lĩnh vực Mobile/Flutter/GIS

Nếu bạn quan tâm, đừng ngại liên hệ qua email!

---

## 📄 License

Dự án này hiện tại là **Private** (sử dụng cho mục đích học tập và chuyên đề tốt
nghiệp).

Mọi quyền được bảo lưu bởi tác giả.

---

## 🙏 Acknowledgments

- **ArcGIS for Developers** - Cung cấp Maps SDK và Routing API
- **Supabase** - Backend-as-a-Service platform
- **Flutter Team** - Framework tuyệt vời
- **Firebase** - Analytics và Messaging services
- **Thầy cô hướng dẫn** - Hỗ trợ trong quá trình thực hiện chuyên đề

---

## 📚 Tài liệu tham khảo

- [ArcGIS Maps SDK for Flutter Documentation](https://developers.arcgis.com/flutter/)
- [ArcGIS REST API Reference](https://developers.arcgis.com/rest/)
- [Supabase Documentation](https://supabase.com/docs)
- [Flutter Documentation](https://docs.flutter.dev/)
- [Riverpod Documentation](https://riverpod.dev/)

---

## 🔮 Roadmap

### Đã hoàn thành ✅

- [x] Bản đồ 2D/3D với ArcGIS
- [x] Định tuyến tránh sự cố động
- [x] Báo cáo và quản lý sự cố
- [x] Xác thực người dùng (Google Sign-In)
- [x] Push notifications
- [x] Spatial clustering
- [x] Turn-by-turn directions

### Đang phát triển 🚧

- [ ] Voice navigation (Điều hướng bằng giọng nói)
- [ ] Off-route detection & Auto re-routing
- [ ] Alternative routes (Đề xuất nhiều tuyến đường)
- [ ] Traffic-aware routing (Định tuyến theo traffic thời gian thực)

### Kế hoạch tương lai 🔮

- [ ] Offline maps
- [ ] Social features (Share routes, Comments)
- [ ] Gamification (Points, Badges)
- [ ] AI-based incident prediction
- [ ] Multi-language support
- [ ] iOS optimization & testing

---

<div align="center">

**⭐ Nếu bạn thấy dự án này hữu ích, hãy cho một Star nhé! ⭐**

Made with ❤️ by Võ Trần Phương Thanh

</div>
