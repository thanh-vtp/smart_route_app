import 'dart:convert';

import 'package:smart_route_app/core/database/cache/map_database.dart';
import 'package:smart_route_app/features/search/data/local_datasource/geocoding_local_data_source.dart';
import 'package:sqflite/sqflite.dart';

/// SQLite cho Geocoding/Route.
class GeocodingLocalDataSourceImpl implements GeocodingLocalDataSource {
  final MapDatabase dbHelper;
  GeocodingLocalDataSourceImpl(this.dbHelper);

  @override
  Future<void> saveCache(
    String key,
    String type,
    Map<String, dynamic> data,
  ) async {
    final db = await dbHelper.database;

    await db.insert('geocoding_cache', {
      'cache_key': key,
      'type': type,
      'data': jsonEncode(data),
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<Map<String, dynamic>?> getCache(String key, Duration expiry) async {
    final db = await dbHelper.database;
    final results = await db.query(
      'geocoding_cache',
      where: 'cache_key = ?',
      whereArgs: [key],
    );

    if (results.isEmpty) return null;

    final timestamp = DateTime.fromMillisecondsSinceEpoch(
      results.first['timestamp'] as int,
    );
    if (DateTime.now().difference(timestamp) > expiry) {
      await db.delete(
        'geocoding_cache',
        where: 'cache_key = ?',
        whereArgs: [key],
      );
      return null;
    }

    return jsonDecode(results.first['data'] as String);
  }

  @override
  Future<void> clearAll() async {
    // SQLite có thể xóa dựa trên phép tính thời gian ngay trong câu lệnh SQL
    final db = await dbHelper.database;
    final now = DateTime.now().millisecondsSinceEpoch;
    // Xóa các bản ghi cũ hơn 7 ngày (ví dụ)
    final sevenDaysInMs = 7 * 24 * 60 * 60 * 1000;
    await db.delete(
      'geocoding_cache',
      where: 'timestamp < ?',
      whereArgs: [now - sevenDaysInMs],
    );
  }

  @override
  Future<void> clearExpired() async {
    final db = await dbHelper.database;
    await db.delete('geocoding_cache');
  }

  @override
  Future<List<Map<String, dynamic>>> getRecentHistory({
    required String type,
    int limit = 10,
  }) async {
    final db = await dbHelper.database;
    // Truy vấn các bản ghi mới nhất dựa trên timestamp
    final List<Map<String, dynamic>> results = await db.query(
      'geocoding_cache',
      where: 'type = ?',
      whereArgs: [type],
      orderBy: 'timestamp DESC',
      limit: limit,
    );
    return results;
  }

  @override
  Future<void> clearHistory() async {
    final db = await dbHelper.database;
    // Xóa các bản ghi liên quan đến lịch sử tìm kiếm
    // Bạn có thể xóa hết hoặc chỉ xóa các type cụ thể
    await db.delete(
      'geocoding_cache',
      where: 'type IN (?, ?, ?)',
      whereArgs: ['geocode', 'reverse_geocode', 'nearby'],
    );
  }
}
