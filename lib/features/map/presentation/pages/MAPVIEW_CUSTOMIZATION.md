# ArcGIS MapView Customization Guide

## Khắc phục hiện tượng "lưới xám" khi zoom ra ngoài giới hạn bản đồ

### Vấn đề
Khi sử dụng ArcGIS MapView ở chế độ 2D, nếu zoom quá xa hoặc kéo ra ngoài giới hạn bản đồ, bạn sẽ thấy một lớp lưới màu xám (Background Grid) - khác với Google Maps luôn hiển thị mượt mà.

### Nguyên nhân
1. **Hệ tọa độ Web Mercator**: Chỉ hỗ trợ vĩ độ ±85°, không thể hiển thị 2 cực Bắc/Nam
2. **Background Grid mặc định**: ArcGIS SDK hiển thị lưới xám để dev biết giới hạn khung nhìn
3. **Không giới hạn zoom**: Cho phép zoom quá xa, làm lộ viền bản đồ

### Giải pháp đã áp dụng

#### 1. **Đổi màu Background Grid** (map_page.dart - line 155)
```dart
_mapViewController.backgroundGrid = BackgroundGrid(
  color: const Color(0xFFB8D4E8), // Màu xanh nước biển nhạt
  gridLineColor: const Color(0xFFB8D4E8), // Ẩn grid lines
  gridLineWidth: 0,
);
```

**Cách chọn màu phù hợp:**
- **ArcGIS Navigation**: `0xFFB8D4E8` (xanh nhạt)
- **ArcGIS Topographic**: `0xFFA3CCFF` (xanh dương)
- **ArcGIS Imagery**: `0xFF000000` (đen)
- **ArcGIS Streets**: `0xFFE8F4F8` (xanh rất nhạt)

💡 **Tip**: Dùng Color Picker để lấy màu nước biển từ basemap đang dùng!

#### 2. **Bật WrapAround Mode** (map_page.dart - line 161)
```dart
_mapViewController.isWrapAroundEnabled = true;
```
- Cho phép cuộn vô hạn theo chiều **Đông-Tây** (ngang)
- Không giải quyết được chiều **Bắc-Nam** (dọc) do giới hạn Web Mercator

#### 3. **Giới hạn MinScale** (map_page.dart - line 59)
```dart
map.minScale = 150000000;
```
- Không cho phép zoom quá xa (như Google Maps)
- Bản đồ luôn phủ kín màn hình điện thoại
- **Tăng giá trị** = cho phép zoom xa hơn
- **Giảm giá trị** = giới hạn zoom chặt hơn

**Giá trị gợi ý:**
- `50000000` - Chặt (như thành phố)
- `150000000` - Vừa (khuyến nghị) ✅
- `300000000` - Rộng (toàn cầu)

### Kết quả
✅ Không còn lưới xám khi zoom ra  
✅ Trải nghiệm mượt mà như Google Maps  
✅ Màu nền đồng nhất với basemap  

### Kiểm tra
```dart
// Test zoom tối thiểu
final currentScale = await _mapViewController.getMapScale();
print('Current scale: $currentScale');

// Test background color
final bgColor = _mapViewController.backgroundGrid?.color;
print('Background color: ${bgColor?.value.toRadixString(16)}');
```

### Tùy chỉnh nâng cao

#### A. Thay đổi màu theo basemap style
```dart
Color getBackgroundColorForBasemap(BasemapStyle style) {
  switch (style) {
    case BasemapStyle.arcGISNavigation:
      return const Color(0xFFB8D4E8);
    case BasemapStyle.arcGISTopographic:
      return const Color(0xFFA3CCFF);
    case BasemapStyle.arcGISImagery:
      return const Color(0xFF000000);
    default:
      return const Color(0xFFE8F4F8);
  }
}
```

#### B. Dynamic scale limit theo màn hình
```dart
// Cho màn hình lớn (tablet) zoom xa hơn
final screenWidth = MediaQuery.of(context).size.width;
final minScale = screenWidth > 600 ? 300000000.0 : 150000000.0;
map.minScale = minScale;
```

#### C. Tắt hoàn toàn Background Grid
```dart
_mapViewController.backgroundGrid = BackgroundGrid(
  isVisible: false, // Ẩn hoàn toàn
);
```

### Tham khảo
- [ArcGIS MapView API](https://developers.arcgis.com/flutter/maps-2d/)
- [Web Mercator Projection](https://en.wikipedia.org/wiki/Web_Mercator_projection)
- [Google Maps Styling Tricks](https://developers.google.com/maps/documentation/javascript/styling)

---

**Cập nhật**: 2025-11-30  
**File**: `lib/features/map/presentation/pages/map_page.dart`
