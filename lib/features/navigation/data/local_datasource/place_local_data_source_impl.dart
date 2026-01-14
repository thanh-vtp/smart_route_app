import 'package:smart_route_app/core/database/data/local_data_source.dart';

abstract class PlaceLocalDataSource extends LocalCacheDataSource {
  /// Lấy danh sách lịch sử mới nhất theo loại (geocode, reverse_geocode, nearby)
  Future<List<Map<String, dynamic>>> getRecentHistory(int limit);

  /// Xóa toàn bộ lịch sử tìm kiếm
  Future<void> clearHistory();
}

class PlaceLocalDataSourceImpl extends BaseSQLiteCache
    implements PlaceLocalDataSource {
  PlaceLocalDataSourceImpl(super.dbHelper);

  @override
  String get tableName => 'place_cache';

  @override
  Future<List<Map<String, dynamic>>> getRecentHistory(int limit) async {
    final db = await dbHelper.database;
    // Truy vấn các bản ghi mới nhất dựa trên timestamp
    final List<Map<String, dynamic>> results = await db.query(
      tableName,
      orderBy: 'timestamp DESC',
      limit: limit,
    );
    return results;
  }

  @override
  Future<void> clearHistory() async {
    final db = await dbHelper.database;
    // Xóa toàn bộ lịch sử tìm kiếm
    await db.delete(tableName);
  }
}
