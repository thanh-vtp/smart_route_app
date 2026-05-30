// import 'dart:convert';
// import 'package:smart_route_app/core/database/cache/map_database.dart';
// import 'package:smart_route_app/features/incident/data/models/incident_supabase_model.dart';

// /// Cache and retrieve incident data from ArchGIS Remote Data Source
// abstract class IncidentLocalDataSource {
//   Future<void> cacheArcGisIncidents(List<IncidentModel> incidents);

//   Future<List<IncidentModel>> getCachedArcGisIncidents();

//   /// Đếm số lượng incidents trong cache
//   Future<int> getCacheCount();

//   /// Xóa tất cả cache incidents
//   Future<void> clearAll();
// }

// class IncidentLocalDataSourceImpl implements IncidentLocalDataSource {
//   final MapDatabase dbHelper;
//   IncidentLocalDataSourceImpl(this.dbHelper);

//   @override
//   Future<void> cacheArcGisIncidents(List<IncidentModel> incidents) async {
//     final db = await dbHelper.database;
//     final batch = db.batch();

//     // Xóa cache cũ trước khi lưu mới (hoặc cập nhật tùy logic)
//     batch.delete('incidents');

//     for (var incident in incidents) {
//       batch.insert('incidents', {
//         'id': incident.id, // ObjectID hoặc UUID
//         'data': jsonEncode(incident.toJson()),
//         'timestamp': DateTime.now().millisecondsSinceEpoch,
//       });
//     }
//     await batch.commit(noResult: true);
//   }

//   @override
//   Future<List<IncidentModel>> getCachedArcGisIncidents() async {
//     final db = await dbHelper.database;
//     final List<Map<String, dynamic>> maps = await db.query('incidents');

//     return maps.map((item) {
//       return IncidentModel.fromJson(jsonDecode(item['data'] as String));
//     }).toList();
//   }

//   @override
//   Future<int> getCacheCount() async {
//     final db = await dbHelper.database;
//     final result = await db.rawQuery('SELECT COUNT(*) as count FROM incidents');
//     return result.first['count'] as int? ?? 0;
//   }

//   @override
//   Future<void> clearAll() async {
//     final db = await dbHelper.database;
//     await db.delete('incidents');
//   }
// }
