# Map Feature Refactoring

## Tổng quan
File `map_page.dart` đã được refactor để tách code thành các widget và helper nhỏ hơn, dễ maintain và test.

## Cấu trúc mới

### 📁 Widgets (lib/features/map/presentation/widgets/)

#### 1. **map_controls_overlay.dart**
Widget hiển thị các controls trên map:
- Basemap switcher
- Map mode switcher (2D/3D)

**Sử dụng:**
```dart
const MapControlsOverlay()
```

#### 2. **map_floating_actions.dart**
Widget hiển thị các Floating Action Buttons:
- Location button (GPS)
- Directions button

**Sử dụng:**
```dart
const MapFloatingActions()
```

#### 3. **map_state_overlays.dart**
Các widget hiển thị trạng thái map:
- `MapLoadingOverlay` - Loading indicator khi fetch incidents
- `MapSubmittingOverlay` - Loading khi submit incident
- `MapErrorOverlay` - Error message với retry button

**Sử dụng:**
```dart
// Loading
const MapLoadingOverlay()

// Submitting
const MapSubmittingOverlay()

// Error
MapErrorOverlay(
  message: 'Error message',
  onRetry: () => fetchData(),
)
```

### 📁 Helpers (lib/features/map/presentation/helpers/)

#### **map_configuration_helper.dart**
Helper class để cấu hình ArcGIS Map/Scene:

**Methods:**
```dart
// Tạo map với cấu hình
MapConfigurationHelper.createConfiguredMap(
  baseMapStyle: BasemapStyle.arcGISNavigation,
  minScale: 100000000, // Optional
)

// Tạo scene với cấu hình
MapConfigurationHelper.createConfiguredScene(
  baseMapStyle: BasemapStyle.arcGISNavigation,
)

// Tạo BackgroundGrid màu nước biển
MapConfigurationHelper.createOceanBackgroundGrid()

// Tạo BackgroundGrid động theo basemap style
MapConfigurationHelper.createDynamicBackgroundGrid(
  BasemapStyle.arcGISNavigation,
)

// Lấy màu background phù hợp
Color color = MapConfigurationHelper.getBackgroundColorForBasemap(
  BasemapStyle.arcGISTopographic,
)
```

## Lợi ích của refactoring

### ✅ Tách biệt concerns
- **UI widgets** tách riêng khỏi business logic
- **Configuration logic** tập trung ở helper
- **State management** rõ ràng hơn

### ✅ Dễ maintain
- Mỗi widget có một trách nhiệm duy nhất
- Code dễ đọc và hiểu
- Dễ debug khi có lỗi

### ✅ Dễ test
- Có thể test từng widget độc lập
- Mock dependencies dễ dàng
- Unit test helper functions

### ✅ Tái sử dụng
- Widgets có thể dùng ở màn hình khác
- Helper functions tái sử dụng được
- Giảm code duplication

## So sánh trước và sau

### Trước (map_page.dart - 676 lines)
```dart
class _MapPageState extends ConsumerState<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack([
        // Map view
        // Inline loading UI (20+ lines)
        // Inline error UI (30+ lines)
        // Inline controls (15+ lines)
      ]),
      floatingActionButton: Column([
        // Inline buttons (20+ lines)
      ]),
    );
  }
}
```

### Sau (map_page.dart - ~500 lines)
```dart
class _MapPageState extends ConsumerState<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack([
        // Map view
        _buildStateUI(mapState),
        const MapControlsOverlay(),
      ]),
      floatingActionButton: const MapFloatingActions(),
    );
  }
  
  Widget _buildStateUI(MapState state) {
    return state.when(
      loading: () => const MapLoadingOverlay(),
      error: (failure) => MapErrorOverlay(...),
      // ...
    );
  }
}
```

## Files tạo mới

1. `lib/features/map/presentation/widgets/map_controls_overlay.dart`
2. `lib/features/map/presentation/widgets/map_floating_actions.dart`
3. `lib/features/map/presentation/widgets/map_state_overlays.dart`
4. `lib/features/map/presentation/helpers/map_configuration_helper.dart`

## Migration Guide

Nếu bạn có code cũ sử dụng trực tiếp từ `map_page.dart`:

### Thay vì:
```dart
// Khởi tạo map thủ công
final map = ArcGISMap.withBasemapStyle(style);
map.minScale = 100000000;
```

### Dùng:
```dart
final map = MapConfigurationHelper.createConfiguredMap(
  baseMapStyle: style,
);
```

### Thay vì:
```dart
// Tạo background grid thủ công
BackgroundGrid(
  backgroundColor: const Color(0xFFA8C8E1),
  lineColor: const Color(0xFFA8C8E1),
  lineWidth: 0,
)
```

### Dùng:
```dart
MapConfigurationHelper.createOceanBackgroundGrid()
```

## Testing

### Widget Tests
```dart
testWidgets('MapLoadingOverlay shows loading indicator', (tester) async {
  await tester.pumpWidget(
    const MaterialApp(home: MapLoadingOverlay()),
  );
  
  expect(find.byType(CircularProgressIndicator), findsOneWidget);
  expect(find.text('Đang tải dữ liệu sự cố...'), findsOneWidget);
});
```

### Unit Tests
```dart
test('createConfiguredMap sets minScale correctly', () {
  final map = MapConfigurationHelper.createConfiguredMap(
    baseMapStyle: BasemapStyle.arcGISNavigation,
    minScale: 50000000,
  );
  
  expect(map.minScale, equals(50000000));
});
```

## Roadmap

### Phase 2 - Future improvements:
- [ ] Tách logic graphics overlay ra service
- [ ] Tạo MapEventHandler để xử lý tap events
- [ ] Implement analytics tracking
- [ ] Add performance monitoring
- [ ] Create snapshot testing

---

**Cập nhật**: 2025-11-30  
**Files modified**: `map_page.dart`  
**Files created**: 4 new files  
**Lines reduced**: ~150+ lines
