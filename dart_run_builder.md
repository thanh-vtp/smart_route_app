
/// Run build runner to generate code:
dart run build_runner build --delete-conflicting-outputs
--version mới: 
dart run build_runner clean
dart run build_runner build

/// build debug:
flutter build apk --debug

/// build release:
flutter build apk --release

/// install app:
flutter install

/// core sdk arcgis:
dart run arcgis_maps install

/// gen splash screen
dart run flutter_native_splash:create

/// gen icon app
dart run flutter_launcher_icons

/// chạy ứng dụng Flutter và nạp các biến môi trường (environment variables) từ file .env vào lúc build/run.

1. flutter run
2. --dart-define-from-file=.env

Tham số này yêu cầu Flutter:
Đọc file .env
Lấy các cặp KEY=VALUE
Truyền chúng vào quá trình compile

Ví dụ file .env:
flutter run --dart-define-from-file=.env