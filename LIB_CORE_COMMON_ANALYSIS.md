# 📐 Phân Tích Kiến Trúc `lib/core/common`

## 🎯 Tổng Quan

`lib/core/common` là module core chứa tất cả logic dùng chung cho **ArcGIS Maps** trong ứng dụng Smart Route. Module này được thiết kế theo **Clean Architecture** với nhiều design patterns.

---

## 📁 Cấu Trúc Thư Mục

```
lib/core/common/
├── map/                          # Core map functionality
│   ├── controller/               # Native controller wrappers
│   ├── engine/                   # Map engine (2D/3D switching)
│   ├── facade/                   # Facade pattern - Main entry point
│   ├── factories/                # Factory pattern - Object creation
│   ├── interactions/             # User interaction handling
│   ├── location/                 # GPS/Location management
│   ├── overlays/                 # Graphics overlay management
│   ├── providers/                # Riverpod providers
│   ├── state/                    # State management
│   └── symbols/                  # Symbol factory & caching
├── provider/                     # Shared Riverpod providers
├── screens/                      # Shared UI screens
│   ├── provider/                 # Screen-level providers
│   ├── state/                    # Screen state management
│   └── widgets/                  # Reusable widgets
└── incident_type_config.dart     # Incident configuration
```

---

## 🏗️ Kiến Trúc Layers

### Layer 1: UI Layer (Screens/Widgets)
**Trách nhiệm**: Hiển thị UI, nhận user input

**Files chính**:
- `screens/map_page.dart` - Main map screen (đang bị comment)
- `screens/widgets/location_button.dart` - GPS button
- `screens/widgets/map_floating_actions.dart` - FAB actions
- `screens/widgets/map_2d_widget.dart` - 2D map widget
- `screens/widgets/map_3d_widget.dart` - 3D scene widget

**Luồng**:
```
User Action → Widget → Provider → Facade
```

---

### Layer 2: State Management (Providers/Notifiers)
**Trách nhiệm**: Quản lý state, business logic

**Files chính**:
- `screens/map_page_notifier.dart` - Main map state notifier
- `screens/provider/map_facade_provider.dart` - Facade provider
- `provider/is_following_user_provider.dart` - GPS follow state

**State Flow**:
```dart
MapPageNotifier
  ├── fetchIncidents() → GetIncidentsUsecase
  ├── addIncident() → AddIncidentUsecase
  ├── updateIncident() → UpdateIncidentUsecase
  └── deleteIncident() → DeleteIncidentUsecase
```

---

### Layer 3: Facade Layer
**Trách nhiệm**: Đơn giản hóa API phức tạp, che giấu implementation details

**Files chính**:
- `map/facade/map_facade.dart` - Interface
- `map/facade/map_facade_impl.dart` - Implementation
- `map/facade/map_facade_dependencies.dart` - Dependency container

**API Methods**:
```dart
interface MapFacade {
  // Initialization
  Future<void> initialize({required BasemapStyle basemapStyle});
  
  // View switching
  Future<void> switchTo2D();
  Future<void> switchTo3D();
  
  // Basemap
  Future<void> changeBasemap(BasemapStyle style);
  
  // Data rendering
  Future<void> renderIncidents(List<Incident> incidents);
  
  // User interaction
  Future<InteractionResult> onTap(Offset screenPoint);
  
  // Location
  Future<void> startLocation();
  Future<void> stopLocation();
  void recenterLocation();
  
  // Cleanup
  void dispose();
}
```

---

### Layer 4: Engine Layer
**Trách nhiệm**: Quản lý map/scene lifecycle, switching 2D/3D

**Files chính**:
- `map/engine/map_engine.dart` - Interface
- `map/engine/map_engine_impl.dart` - Implementation
- `map/engine/map_runtime_state.dart` - Runtime state
- `map/engine/viewpoint_sync_manager.dart` - Sync camera 2D↔3D

**Responsibilities**:
```dart
MapEngine {
  // Initialize maps
  initialize2D(basemapStyle)
  initialize3D(basemapStyle)
  
  // Switch views
  switchTo2D()
  switchTo3D()
  
  // Sync cameras
  sync2DTo3D()
  sync3DTo2D()
  
  // State
  bool is3DMode
  BasemapStyle currentBasemapStyle
}
```

---

### Layer 5: Controller Layer
**Trách nhiệm**: Wrap native ArcGIS controllers, manage lifecycle

**Files chính**:
- `map/controller/map_controller_bundle.dart` - Bundle of controllers
- `map/controller/map_view_controller_provider.dart` - 2D provider
- `map/controller/scene_view_controller_provider.dart` - 3D provider

**Bundle Pattern**:
```dart
class MapControllerBundle {
  final ArcGISMapViewController _map2D;
  final ArcGISSceneViewController _scene3D;
  
  ArcGISMapViewController get map2D;
  ArcGISSceneViewController get scene3D;
  
  void dispose();
}
```

---

### Layer 6: Manager/Controller Layers
**Trách nhiệm**: Specific domain logic

#### A. Overlay Management
**Files**:
- `map/overlays/overlay_manager.dart` - Orchestration
- `map/overlays/incident_overlay_controller.dart` - Incident rendering
- `map/overlays/route_layer_manager.dart` - Route rendering

**Flow**:
```
IncidentOverlayController
  ├── renderIncidents(List<Incident>)
  │   ├── _upsertIncident(incident)
  │   │   ├── Create ArcGISPoint
  │   │   ├── Get Symbol from Factory
  │   │   └── Create Graphic
  │   └── Add to GraphicsOverlay
  └── clear()
```

#### B. Interaction Management
**Files**:
- `map/interactions/map_interaction_controller.dart` - Main controller
- `map/interactions/identify_result_mapper.dart` - Result mapping
- `map/interactions/interaction_result.dart` - Result types

**Flow**:
```
User Tap → handleTap(screenPoint)
  ├── identifyGraphicsOverlay(overlay, screenPoint)
  ├── mapper.map(identifyResult)
  └── return InteractionResult
```

#### C. Location Management
**Files**:
- `map/location/device_location_controller.dart` - GPS controller
- `map/location/location_state.dart` - Location state
- `map/location/location_status.dart` - Status enum

**Flow**:
```
startLocation()
  ├── Configure LocationDisplay
  ├── Start SystemLocationDataSource
  ├── Listen onLocationChanged
  └── Set autoPanMode = recenter
```

---

### Layer 7: Factory & Symbol Layer
**Trách nhiệm**: Create objects, manage symbols

#### A. Map Object Factory
**File**: `map/factories/map_object_factory.dart`

**Methods**:
```dart
static ArcGISMap create2DMap({required BasemapStyle style})
static ArcGISScene create3DScene({required BasemapStyle style})
static BackgroundGrid createBackgroundGrid(BasemapStyle style)
static Viewpoint defaultViewpoint()
```

#### B. Symbol Factory & Cache
**Files**:
- `map/symbols/incident_symbol_factory.dart` - Factory
- `map/symbols/symbol_cache.dart` - Cache
- `map/symbols/symbol_preloader.dart` - Preloader
- `map/symbols/symbol_config.dart` - Configuration
- `map/symbols/symbol_keys.dart` - Cache keys

**Flow**:
```
getSymbol(typeId)
  ├── Check SymbolCache
  ├── If cached → return
  └── If not cached:
      ├── Load ArcGISImage.fromAsset()
      ├── Create PictureMarkerSymbol
      ├── Set size, offsetY
      ├── Cache symbol
      └── return symbol
```

---

## 🔄 Luồng Hoạt Động Chính

### 1. Khởi Tạo App (Initialization Flow)

```
App Start
  ↓
MapFacadeProvider (Riverpod)
  ├── Create MapControllerBundle
  │   ├── ArcGISMapViewController (2D)
  │   └── ArcGISSceneViewController (3D)
  ├── Create MapEngine
  ├── Create OverlayManager
  ├── Create IncidentOverlayController
  ├── Create MapInteractionController
  ├── Create DeviceLocationController
  └── Create SymbolPreloader
  ↓
MapFacadeImpl.initialize()
  ├── engine.initialize2D(basemapStyle)
  │   ├── MapObjectFactory.create2DMap()
  │   └── Set to controller
  ├── symbolPreloader.preload()
  │   └── Pre-cache all symbols
  └── overlayManager.moveTo2D(incidentOverlay)
```

### 2. Render Incidents (Data Flow)

```
MapPageNotifier.fetchIncidents()
  ↓
GetIncidentsUsecase.call()
  ↓
Repository → DataSource → API/Cache
  ↓
Success: List<Incident>
  ↓
MapPageNotifier: state = loaded(incidents)
  ↓
UI listens to state change
  ↓
MapFacade.renderIncidents(incidents)
  ↓
IncidentOverlayController.renderIncidents()
  ├── For each incident:
  │   ├── Create ArcGISPoint(lat, lng)
  │   ├── SymbolFactory.getSymbol(type)
  │   │   ├── Check cache
  │   │   └── Load from asset if needed
  │   ├── Create Graphic(point, symbol, attributes)
  │   └── overlay.graphics.add(graphic)
  └── Log: "Rendered X incidents"
```

### 3. User Tap Interaction (Interaction Flow)

```
User taps on map
  ↓
ArcGISMapView.onTap(screenPoint)
  ↓
MapFacade.onTap(screenPoint)
  ↓
MapInteractionController.handleTap()
  ├── Determine 2D or 3D
  ├── controller.identifyGraphicsOverlay(overlay, screenPoint)
  │   └── Returns IdentifyGraphicsOverlayResult
  ├── mapper.map(result)
  │   ├── Extract incident_id from attributes
  │   └── Create InteractionResult.incident(id)
  └── return InteractionResult
  ↓
UI receives result
  ├── If incident tapped:
  │   └── Show IncidentDetailBottomSheet
  └── If empty space:
      └── Close bottom sheet
```

### 4. Location/GPS Flow

```
User presses GPS button
  ↓
LocationButton.onPressed()
  ↓
Check LocationDataSource.status
  ├── If not started:
  │   └── MapFacade.startLocation()
  │       ↓
  │       DeviceLocationController.start()
  │       ├── Configure LocationDisplay
  │       ├── Set dataSource
  │       ├── Listen onLocationChanged
  │       ├── Start dataSource
  │       └── Set autoPanMode = recenter
  └── If already started:
      └── MapFacade.recenterLocation()
          └── Set autoPanMode = recenter
```

### 5. Switch 2D ↔ 3D Flow

```
User toggles map mode
  ↓
MapModeProvider changes
  ↓
MapPage listens to change
  ↓
MapFacade.switchTo3D() or switchTo2D()
  ↓
MapEngine.switchTo3D()
  ├── Set state: isSwitchingView = true
  ├── initialize3D(basemapStyle) if needed
  ├── sync2DTo3D()
  │   └── ViewpointSyncManager copies camera
  └── Set state: is3DMode = true
  ↓
OverlayManager.moveTo3D(incidentOverlay)
  ├── Detach from 2D
  └── Attach to 3D
  ↓
UI rebuilds with IndexedStack
  └── Shows 3D view
```

---

## 🎨 Design Patterns Được Sử Dụng

### 1. **Facade Pattern** ⭐⭐⭐⭐⭐
**Location**: `map/facade/`

**Mục đích**: Che giấu complexity của ArcGIS SDK, cung cấp API đơn giản

**Example**:
```dart
// Thay vì:
controller.arcGISMap = ArcGISMap.withBasemapStyle(style);
controller.backgroundGrid = BackgroundGrid(...);
overlay.graphics.add(graphic);
locationDisplay.dataSource = SystemLocationDataSource();
// ...

// Chỉ cần:
mapFacade.initialize(basemapStyle: style);
mapFacade.renderIncidents(incidents);
mapFacade.startLocation();
```

**Đánh giá**: ✅ Excellent - Giảm coupling, dễ test, dễ maintain

---

### 2. **Factory Pattern** ⭐⭐⭐⭐⭐
**Location**: `map/factories/`, `map/symbols/`

**Mục đích**: Centralize object creation logic

**Examples**:
```dart
// MapObjectFactory
final map = MapObjectFactory.create2DMap(style: style);
final scene = MapObjectFactory.create3DScene(style: style);

// IncidentSymbolFactory
final symbol = await symbolFactory.getSymbol(typeId);
```

**Đánh giá**: ✅ Excellent - Consistent creation, easy to modify

---

### 3. **Dependency Injection** ⭐⭐⭐⭐⭐
**Location**: `map/facade/map_facade_dependencies.dart`

**Mục đích**: Loose coupling, testability

**Example**:
```dart
class MapFacadeDependencies {
  final MapControllerBundle controllers;
  final MapEngine engine;
  final OverlayManager overlayManager;
  final IncidentOverlayController incidentOverlayController;
  final MapInteractionController interactionController;
  final DeviceLocationController locationController;
  final SymbolPreloader symbolPreloader;
}

// Usage
final facade = MapFacadeImpl(dependencies);
```

**Đánh giá**: ✅ Excellent - Easy to mock, test, swap implementations

---

### 4. **Repository Pattern** ⭐⭐⭐⭐
**Location**: Integrated with UseCases

**Mục đích**: Abstract data source

**Flow**:
```
MapPageNotifier
  → GetIncidentsUsecase
    → IncidentRepository
      → RemoteDataSource / LocalDataSource
```

**Đánh giá**: ✅ Good - Clean separation of concerns

---

### 5. **State Pattern** ⭐⭐⭐⭐
**Location**: `screens/map_page_state.dart`

**Mục đích**: Manage different UI states

**States**:
```dart
sealed class MapPageState {
  const factory MapPageState.initial();
  const factory MapPageState.loading();
  const factory MapPageState.loaded({required List<Incident> incidents});
  const factory MapPageState.submitting({required List<Incident> incidents});
  const factory MapPageState.submitted({required List<Incident> incidents});
  const factory MapPageState.error({required Failure failure});
  const factory MapPageState.clusterLoaded({required List<ClusterItem> clusters});
}
```

**Đánh giá**: ✅ Excellent - Clear state transitions, type-safe

---

### 6. **Observer Pattern** ⭐⭐⭐⭐⭐
**Location**: Riverpod providers, StreamSubscriptions

**Mục đích**: React to state changes

**Examples**:
```dart
// Riverpod
ref.listen(mapPageNotifierProvider, (previous, state) {
  state.whenOrNull(
    loaded: (incidents) => mapFacade.renderIncidents(incidents),
  );
});

// Stream
controller.onViewpointChanged.listen((viewpoint) {
  // Update map center
});
```

**Đánh giá**: ✅ Excellent - Reactive, decoupled

---

### 7. **Cache Pattern** ⭐⭐⭐
**Location**: `map/symbols/symbol_cache.dart`

**Mục đích**: Avoid recreating expensive objects

**Implementation**:
```dart
class SymbolCache {
  static final Map<String, ArcGISSymbol> _symbols = {};
  
  static T? get<T extends ArcGISSymbol>(String key);
  static void set(String key, ArcGISSymbol symbol);
}
```

**Đánh giá**: ⚠️ Basic - Cần nâng cấp thành LRU cache

---

### 8. **Bundle Pattern** ⭐⭐⭐⭐
**Location**: `map/controller/map_controller_bundle.dart`

**Mục đích**: Group related controllers, manage lifecycle together

**Implementation**:
```dart
class MapControllerBundle {
  final ArcGISMapViewController _map2D;
  final ArcGISSceneViewController _scene3D;
  
  void dispose() {
    _map2D.dispose();
    _scene3D.dispose();
  }
}
```

**Đánh giá**: ✅ Good - Prevents memory leaks, clear ownership

---

## 📊 Dependency Graph

```
┌─────────────────────────────────────────────────────────┐
│                      UI Layer                           │
│  MapPage, Widgets, LocationButton                       │
└────────────────────┬────────────────────────────────────┘
                     │
                     ↓
┌─────────────────────────────────────────────────────────┐
│                 State Management                        │
│  MapPageNotifier, Providers                             │
└────────────────────┬────────────────────────────────────┘
                     │
                     ↓
┌─────────────────────────────────────────────────────────┐
│                  Facade Layer                           │
│  MapFacade (Interface)                                  │
│  MapFacadeImpl (Implementation)                         │
└────────────────────┬────────────────────────────────────┘
                     │
        ┌────────────┼────────────┬────────────┐
        ↓            ↓            ↓            ↓
┌──────────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐
│   Engine     │ │ Overlay  │ │Interaction│ │ Location │
│              │ │ Manager  │ │Controller │ │Controller│
└──────┬───────┘ └────┬─────┘ └────┬──────┘ └────┬─────┘
       │              │            │             │
       ↓              ↓            ↓             ↓
┌──────────────────────────────────────────────────────┐
│              Controller Bundle                       │
│  ArcGISMapViewController, ArcGISSceneViewController  │
└──────────────────────────────────────────────────────┘
       │              │            │             │
       ↓              ↓            ↓             ↓
┌──────────────────────────────────────────────────────┐
│                 ArcGIS SDK                           │
└──────────────────────────────────────────────────────┘
```

---

## 🔑 Key Classes & Responsibilities

### 1. MapFacade
**Role**: Main entry point, orchestrator
**Methods**: 10 public methods
**Dependencies**: 7 injected dependencies
**Complexity**: Medium

### 2. MapEngine
**Role**: Manage map/scene lifecycle, 2D/3D switching
**Methods**: 10 methods
**State**: MapRuntimeState
**Complexity**: Medium-High

### 3. IncidentOverlayController
**Role**: Render incidents on map
**Methods**: 3 public methods
**Cache**: Map<String, Graphic>
**Complexity**: Medium

### 4. MapInteractionController
**Role**: Handle user taps, identify graphics
**Methods**: 1 main method (handleTap)
**Complexity**: Low

### 5. DeviceLocationController
**Role**: Manage GPS, location display
**Methods**: 4 methods (start, stop, recenter, dispose)
**Complexity**: Medium

### 6. IncidentSymbolFactory
**Role**: Create and cache symbols
**Methods**: 2 methods (getSymbol, getHighlightSymbol)
**Cache**: SymbolCache
**Complexity**: Low

### 7. MapPageNotifier
**Role**: Business logic, state management
**Methods**: 7 methods (fetch, add, update, delete, etc.)
**State**: MapPageState (sealed class)
**Complexity**: High

---

## ⚡ Performance Optimizations

### 1. Symbol Preloading
```dart
SymbolPreloader.preload()
  └── Pre-cache all symbols at startup
      └── Avoid lag when rendering incidents
```

### 2. Graphic Caching
```dart
Map<String, Graphic> _graphicsById
  └── Reuse graphics, only update geometry
```

### 3. Debounced Map Updates
```dart
Timer _debounceTimer;
onViewpointChanged.listen((_) {
  _debounceTimer?.cancel();
  _debounceTimer = Timer(200ms, () {
    // Update map center
  });
});
```

### 4. Lazy Initialization
```dart
// Only initialize 3D when needed
if (controllers.scene3D.arcGISScene == null) {
  await initialize3D();
}
```

---

## 🚨 Vấn Đề & Cải Thiện

### 1. ❌ Code Bị Comment Out
**Files**:
- `screens/map_page.dart` - Toàn bộ file
- `map/location/device_location_manager.dart`
- `map/overlays/incident_layer_manager.dart`
- `map/interactions/map_interaction_manager.dart`

**Action**: Xóa hoặc uncomment

### 2. ⚠️ Cache Không Có Limit
**File**: `map/symbols/symbol_cache.dart`

**Problem**: Unlimited cache size
**Solution**: Implement LRU cache với max size

### 3. ⚠️ Error Handling Không Consistent
**Problem**: Một số nơi có try-catch, một số không
**Solution**: Tạo `ArcGISErrorHandler` utility

### 4. ⚠️ Import Paths Dài
**Problem**:
```dart
import 'package:smart_route_app/core/common/map/facade/map_facade_impl.dart';
```

**Solution**: Tạo barrel exports
```dart
// lib/core/common/map.dart
export 'map/facade/map_facade.dart';
export 'map/facade/map_facade_impl.dart';
// ...
```

### 5. ⚠️ Thiếu Documentation
**Problem**: Không có README, ít comments
**Solution**: Thêm README.md và dartdoc comments

---

## 📈 Metrics

| Metric | Value | Status |
|--------|-------|--------|
| Total Files | 60+ | ⚠️ High |
| Layers | 7 | ✅ Good |
| Design Patterns | 8 | ✅ Excellent |
| Commented Code | ~30% | ❌ Bad |
| Test Coverage | Unknown | ⚠️ Need tests |
| Cyclomatic Complexity | Medium | ✅ Acceptable |

---

## 🎯 Khuyến Nghị

### Ngắn Hạn (1-2 tuần)
1. ✅ Uncomment hoặc xóa code bị comment
2. ✅ Thêm README.md cho `lib/core/common/`
3. ✅ Tạo barrel exports
4. ✅ Standardize error handling

### Trung Hạn (1 tháng)
1. ✅ Implement LRU cache
2. ✅ Add unit tests cho factories
3. ✅ Add integration tests cho facade
4. ✅ Improve documentation

### Dài Hạn (2-3 tháng)
1. ✅ Đánh giá và đơn giản hóa architecture nếu cần
2. ✅ Performance profiling
3. ✅ Add widget tests
4. ✅ Implement analytics/monitoring

---

## ✅ Kết Luận

### Điểm Mạnh:
1. ✅ **Architecture rõ ràng**: Layers phân tách tốt
2. ✅ **Design patterns tốt**: Facade, Factory, DI, State
3. ✅ **Testability cao**: Loose coupling, DI
4. ✅ **Performance tốt**: Caching, preloading, debouncing
5. ✅ **Maintainability**: Code organized, single responsibility

### Điểm Cần Cải Thiện:
1. ⚠️ **Dọn dẹp code**: Xóa commented code
2. ⚠️ **Documentation**: Thêm README và comments
3. ⚠️ **Testing**: Cần thêm tests
4. ⚠️ **Cache**: Nâng cấp thành LRU
5. ⚠️ **Error handling**: Standardize

### Đánh Giá Tổng Thể: **8/10** ⭐⭐⭐⭐

Architecture tốt, design patterns xuất sắc, nhưng cần hoàn thiện documentation và testing.

---

**Người phân tích**: Kiro AI Assistant  
**Ngày**: 28/05/2026  
**Version**: 1.0
