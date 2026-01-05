abstract class GeocodingLocalDataSource {
  Future<void> saveCache(String key, String type, Map<String, dynamic> data);
  Future<Map<String, dynamic>?> getCache(String key, Duration expiry);
  Future<void> clearExpired();
  Future<void> clearAll();

  /// Lấy danh sách lịch sử mới nhất theo loại (geocode, reverse_geocode, nearby)
  Future<List<Map<String, dynamic>>> getRecentHistory({
    required String type,
    int limit = 10,
  });

  /// Xóa toàn bộ lịch sử tìm kiếm
  Future<void> clearHistory();
}
