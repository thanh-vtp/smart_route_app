PHÂN TÍCH FEATURE NAVIGATION - ROUTING API
1. Lịch sử Commit quan trọng
Commit 9ffcf86 - "Add support route barriers, returnBarriers":

Đã hỗ trợ truyền danh sách barriers (điểm sự cố) dạng tường minh
Parameters: barriers - List<Map<String, double>> với longitude/latitude
Có tham số returnBarriers để API trả về danh sách barriers đã được xử lý
Commit cc046e46 (hiện tại - trong câu hỏi):

Thay đổi quan trọng: Từ barriers (điểm riêng lẻ) sang pointBarriers (URL + WHERE clause)
Cách tiếp cận thông minh hơn: Truyền URL của Feature Layer thay vì liệt kê từng điểm
Query động: "status = 'active' AND severity IN ('high', 'medium')"
Linh hoạt hơn: Tự động lấy sự cố từ database thay vì truyền thủ công
2. Phân tích API Parameters hiện tại
// TẠI: routing_remote_data_source_impl.dart
final queryParameters = <String, dynamic>{
  'stops': stopsString,                          // ✅ BẮT BUỘC
  'f': 'json',                                   // ✅ Format response
  'token': _apiKey,                              // ✅ Authentication
  'returnDirections': 'true',                    // ✅ Trả về hướng dẫn rẽ
  'returnRoutes': 'true',                        // ✅ Trả về geometry đường đi
  'directionsLanguage': 'vi',                    // ✅ Tiếng Việt
  'directionsLengthUnits': 'esriNAUMeters',      // ✅ Đơn vị mét
  'outSR': '4326',                               // ✅ WGS84 coordinate system
  
  // NÉ SỰ CỐ - Feature Layer URL approach
  'pointBarriers': json.encode({
    "url": Constants.serviceTFeatureTableUrl,
    "where": "status = 'active' AND severity IN ('high', 'medium')",
  }),
};
3. CÁC THAM SỐ ARCGIS ROUTING API KHÁC (Chưa sử dụng)
Dựa trên tài liệu ArcGIS REST API và code từ commit cũ, có thể thêm:

🚗 Travel Mode & Impedance
// Chọn phương thức di chuyển
'travelMode': json.encode({
  'attributeParameterValues': [...],
  'description': 'Xe ô tô',
  'impedanceAttributeName': 'TravelTime',  // hoặc 'Kilometers'
  'timeAttributeName': 'TravelTime',
  'distanceAttributeName': 'Kilometers',
  'type': 'AUTOMOBILE',
}),

// Hoặc đơn giản hơn
'impedanceAttributeName': 'TravelTime',     // Tối ưu theo thời gian
// hoặc 'Kilometers'                        // Tối ưu theo quãng đường
🚧 Restrictions (Hạn chế đường đi)
'restrictionAttributeNames': json.encode([
  'Avoid Toll Roads',           // Tránh đường thu phí
  'Avoid Highways',             // Tránh đường cao tốc
  'Avoid Unpaved Roads',        // Tránh đường đất
  'Avoid Private Roads',        // Tránh đường tư nhân
  'Avoid Ferries',              // Tránh phà
  'Height Restriction',         // Hạn chế chiều cao
  'Weight Restriction',         // Hạn chế trọng tải
]),

// Với parameters (ví dụ hạn chế chiều cao xe)
'attributeParameterValues': json.encode([
  {
    'attributeName': 'Height Restriction',
    'parameterName': 'Vehicle Height (meters)',
    'value': 3.5,
  },
]),
🛣️ Line Barriers & Polygon Barriers
// Chặn theo đoạn đường
'polylineBarriers': json.encode({
  'features': [
    {
      'geometry': {
        'paths': [[[lng1, lat1], [lng2, lat2]]],
      },
      'attributes': {
        'BarrierType': 0,  // 0: Restriction, 1: Scaled Cost
      },
    },
  ],
}),

// Chặn theo khu vực
'polygonBarriers': json.encode({
  'features': [
    {
      'geometry': {
        'rings': [[[lng1, lat1], [lng2, lat2], [lng3, lat3], [lng1, lat1]]],
      },
      'attributes': {
        'BarrierType': 0,
      },
    },
  ],
}),
⏰ Time-based Routing (Traffic aware)
'startTime': DateTime.now().millisecondsSinceEpoch,  // Thời gian khởi hành
'startTimeIsUTC': 'false',
'useTimeWindows': 'true',                            // Sử dụng time windows
'useHierarchy': 'true',                              // Sử dụng phân cấp đường (highway > local)
🎯 Route Optimization
'findBestSequence': 'true',              // Tự động sắp xếp thứ tự stops tối ưu
'preserveFirstStop': 'true',             // Giữ nguyên điểm đầu
'preserveLastStop': 'true',              // Giữ nguyên điểm cuối
'returnStops': 'true',                   // Trả về thông tin stops
'returnBarriers': 'true',                // Trả về thông tin barriers
'returnPolygonBarriers': 'true',
'returnPolylineBarriers': 'true',
📐 Output Control
'outputLines': 'esriNAOutputLineTrueShapeWithMeasure',  // Đã dùng trong commit cũ
// Các options khác:
// - 'esriNAOutputLineNone'
// - 'esriNAOutputLineStraight'
// - 'esriNAOutputLineTrueShape'

'outputGeometryPrecision': '0.001',      // Độ chính xác geometry
'outputGeometryPrecisionUnits': 'esriMeters',
🔄 U-Turn Policy
'restrictUTurns': 'esriNFSBAllowBacktrack',
// Options:
// - 'esriNFSBAtDeadEndsOnly'
// - 'esriNFSBAtDeadEndsAndIntersections'
// - 'esriNFSBNoBacktrack'
📊 Accumulate Attributes (Thống kê thêm)
'accumulateAttributeNames': json.encode([
  'Kilometers',        // Tổng km
  'TravelTime',       // Tổng thời gian
  'Tollcost',         // Phí đường bộ
]),
4. SO SÁNH 2 CÁCH TIẾP CẬN
Tiêu chí	Commit cũ (barriers)	Commit hiện tại (pointBarriers URL)
Cách truyền	List điểm cụ thể	URL Feature Layer + WHERE clause
Hiệu quả	Phải fetch trước rồi truyền	API tự query real-time
Linh hoạt	Cố định danh sách	Dynamic query (status, severity)
Performance	Tốt với ít barriers	Tốt hơn với nhiều barriers
Real-time	Cần cập nhật thủ công	Tự động lấy data mới nhất
5. KẾT LUẬN & ĐỀ XUẤT
✅ Đang sử dụng tốt:

pointBarriers với URL approach - Smart!
Các tham số cơ bản (directions, language, units) - Complete
Retry logic và error handling - Robust
🎯 CÓ THỂ BỔ SUNG:

Travel Mode: Cho phép chọn xe máy/ô tô/xe tải với restrictions khác nhau
Impedance: Cho user chọn tối ưu theo thời gian hoặc quãng đường
Restrictions: Tránh đường thu phí, cao tốc, đường đất
Traffic-aware: Routing theo thời gian thực với traffic data
Route Optimization: Tự động sắp xếp stops tối ưu (TSP)
Line/Polygon Barriers: Chặn cả đoạn đường hoặc khu vực
Bạn có muốn tôi implement thêm tham số nào không? 🚀