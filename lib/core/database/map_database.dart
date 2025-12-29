import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// quản lý việc khởi tạo SQLite.
class MapDatabase {
  static final MapDatabase instance = MapDatabase._init();
  static Database? _database;

  MapDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('arcgis_map.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // Bảng lưu Incident (Supabase/ArcGIS)
    await db.execute('''
      CREATE TABLE incidents (
        id TEXT PRIMARY KEY,
        data TEXT NOT NULL,
        timestamp INTEGER NOT NULL
      )
    ''');

    // Bảng lưu Geocoding, Reverse, Route (Dạng Key-Value)
    await db.execute('''
      CREATE TABLE geocoding_cache (
        cache_key TEXT PRIMARY KEY,
        data TEXT NOT NULL,
        type TEXT NOT NULL,
        timestamp INTEGER NOT NULL
      )
    ''');

    // Index để query nhanh hơn
    await db.execute('CREATE INDEX idx_geo_type ON geocoding_cache(type)');
  }
}
