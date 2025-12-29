import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

abstract class ImageryLocalDataSource {
  Future<void> saveImage(String key, Uint8List bytes);
  Future<Uint8List?> getImage(String key, Duration expiry);
  Future<void> clearAll();

  /// Đếm số lượng ảnh trong cache
  Future<int> getCacheCount();
}

/// Lưu Ảnh vệ tinh vào ROM (File System).
class ImageryLocalDataSourceImpl implements ImageryLocalDataSource {
  Future<String> _getCachePath() async {
    final directory = await getApplicationSupportDirectory();
    final path = '${directory.path}/imagery_cache';
    final dir = Directory(path);
    if (!await dir.exists()) await dir.create(recursive: true);
    return path;
  }

  @override
  Future<void> saveImage(String key, Uint8List bytes) async {
    final path = await _getCachePath();
    final file = File('$path/$key.png');
    await file.writeAsBytes(bytes);
  }

  @override
  Future<Uint8List?> getImage(String key, Duration expiry) async {
    final path = await _getCachePath();
    final file = File('$path/$key.png');

    if (await file.exists()) {
      final lastModified = await file.lastModified();
      if (DateTime.now().difference(lastModified) > expiry) {
        await file.delete();
        return null;
      }
      return await file.readAsBytes();
    }
    return null;
  }

  @override
  Future<void> clearAll() async {
    final path = await _getCachePath();
    final dir = Directory(path);
    if (await dir.exists()) {
      await dir.delete(recursive: true);
    }
  }

  @override
  Future<int> getCacheCount() async {
    try {
      final path = await _getCachePath();
      final dir = Directory(path);
      if (!await dir.exists()) return 0;

      final files = await dir.list().where((entity) => entity is File).toList();
      return files.length;
    } catch (e) {
      return 0;
    }
  }
}
