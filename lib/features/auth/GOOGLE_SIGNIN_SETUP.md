# Hướng dẫn khắc phục lỗi Google Sign-In

## Vấn đề hiện tại

```
GoogleSignInException: No credential available: No credentials available
```

**Nguyên nhân:** File `google-services.json` thiếu cấu hình OAuth 2.0 Client
(mảng `oauth_client` đang trống).

## Giải pháp

### Bước 1: Lấy SHA-1 và SHA-256 Fingerprints

Chạy file `get_sha_fingerprints.bat` hoặc chạy lệnh sau trong Command Prompt:

```cmd
cd %USERPROFILE%\.android
keytool -list -v -keystore debug.keystore -alias androiddebugkey -storepass android -keypass android
```

Copy các giá trị:

- **SHA-1:** (ví dụ: `A1:B2:C3:D4:...`)
- **SHA-256:** (ví dụ: `E5:F6:G7:H8:...`)

### Bước 2: Cấu hình Firebase Console

1. Truy cập [Firebase Console](https://console.firebase.google.com/)
2. Chọn project: **smart-route-find-application**
3. Vào **Project Settings** (biểu tượng bánh răng)
4. Chọn tab **General**
5. Scroll xuống phần **Your apps**
6. Tìm app Android: `com.example.smart_route_app`

### Bước 3: Thêm SHA Fingerprints

Trong phần app Android:

1. Click vào **Add fingerprint**
2. Paste SHA-1 fingerprint từ Bước 1
3. Click **Save**
4. Lặp lại để thêm SHA-256 fingerprint

### Bước 4: Cấu hình Google Cloud Console (Nếu cần)

1. Truy cập [Google Cloud Console](https://console.cloud.google.com/)
2. Chọn project: **smart-route-find-application**
3. Vào **APIs & Services** > **Credentials**
4. Tìm OAuth 2.0 Client IDs
5. Kiểm tra xem có Android client với:
   - **Package name:** `com.example.smart_route_app`
   - **SHA-1:** (giá trị vừa lấy ở Bước 1)

   **Nếu chưa có:** Click **Create credentials** > **OAuth client ID** >
   **Android**

### Bước 5: Tải lại google-services.json

1. Quay lại Firebase Console
2. Trong phần app Android, click nút **Download google-services.json**
3. Thay thế file cũ tại: `android/app/google-services.json`

### Bước 6: Rebuild app

```cmd
flutter clean
flutter pub get
flutter run
```

## Xác minh cấu hình

Sau khi tải lại `google-services.json`, file sẽ có dạng:

```json
{
  "client": [
    {
      "client_info": {
        "mobilesdk_app_id": "1:1094897979700:android:...",
        "android_client_info": {
          "package_name": "com.example.smart_route_app"
        }
      },
      "oauth_client": [
        {
          "client_id": "...-...apps.googleusercontent.com",
          "client_type": 1,
          "android_info": {
            "package_name": "com.example.smart_route_app",
            "certificate_hash": "SHA1_FINGERPRINT_HERE"
          }
        },
        {
          "client_id": "...-...apps.googleusercontent.com",
          "client_type": 3
        }
      ],
      ...
    }
  ]
}
```

**Quan trọng:** Mảng `oauth_client` không được để trống!

## Kiểm tra file .env

File `.env` đã có đủ các giá trị:

- ✅ `GOOGLE_CLIENT_ID_WEB` (Web Client ID - dùng làm serverClientId)
- ✅ `GOOGLE_CLIENT_ID_ANDROID` (Android Client ID)

## Debug tips

Nếu vẫn gặp lỗi sau khi cấu hình:

1. **Kiểm tra package name khớp:**
   - AndroidManifest.xml: `com.example.smart_route_app`
   - build.gradle.kts: `com.example.smart_route_app`
   - Firebase Console: `com.example.smart_route_app`

2. **Xóa dữ liệu app trên thiết bị/emulator:**
   ```cmd
   adb shell pm clear com.example.smart_route_app
   ```

3. **Kiểm tra logs chi tiết:**
   ```cmd
   adb logcat | findstr GoogleSignIn
   ```

4. **Verify SHA fingerprints khớp:**
   - SHA trong Firebase Console = SHA từ debug.keystore

## Tài liệu tham khảo

- [Google Sign-In for Android](https://developers.google.com/identity/sign-in/android/start)
- [Firebase Android Setup](https://firebase.google.com/docs/android/setup)
- [google_sign_in Flutter package](https://pub.dev/packages/google_sign_in)
