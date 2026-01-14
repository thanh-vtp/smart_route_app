import 'dart:convert';

import 'package:smart_route_app/core/database/cache/map_database.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalCacheDataSource {
  // Luu trữ dữ liệu vào cache với key và giá trị dạng chuỗi
  Future<void> save(String key, Map<String, dynamic> data);

  /// Lấy dữ liệu từ cache dựa trên key và thời gian hết hạn
  Future<Map<String, dynamic>?> get(String key, {Duration? expiry});

  /// Xóa các bản ghi đã hết hạn khỏi cache
  Future<void> clearExpired(Duration maxAge);

  /// Xóa toàn bộ cache
  Future<void> clearAll();
}

abstract class BaseSQLiteCache implements LocalCacheDataSource {
  final MapDatabase dbHelper;

  // Các lớp con bắt buộc phải cung cấp tên bảng
  String get tableName;

  BaseSQLiteCache(this.dbHelper);

  @override
  Future<void> save(String key, Map<String, dynamic> data) async {
    final db = await dbHelper.database;
    await db.insert(tableName, {
      'cache_key': key,
      'data': jsonEncode(data),
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<Map<String, dynamic>?> get(String key, {Duration? expiry}) async {
    final db = await dbHelper.database;
    final results = await db.query(
      tableName,
      where: 'cache_key = ?',
      whereArgs: [key],
    );

    if (results.isEmpty) return null;

    final row = results.first;
    final timestamp = DateTime.fromMillisecondsSinceEpoch(
      row['timestamp'] as int,
    );

    // Kiểm tra hết hạn (nếu có truyền expiry)
    if (expiry != null) {
      if (DateTime.now().difference(timestamp) > expiry) {
        await db.delete(tableName, where: 'cache_key = ?', whereArgs: [key]);
        return null;
      }
    }

    return jsonDecode(row['data'] as String);
  }

  @override
  Future<void> clearAll() async {
    final db = await dbHelper.database;
    await db.delete(tableName);
  }

  // Logic xóa hết hạn chung
  @override
  Future<void> clearExpired(Duration maxAge) async {
    final db = await dbHelper.database;
    final cutoff = DateTime.now().subtract(maxAge).millisecondsSinceEpoch;
    await db.delete(tableName, where: 'timestamp < ?', whereArgs: [cutoff]);
  }
}
