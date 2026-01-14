import 'dart:typed_data';

abstract class ImageryLocalDataSource {
  Future<void> saveImage(String key, Uint8List bytes);
  Future<Uint8List?> getImage(String key, Duration expiry);
  Future<void> clearAll();

  /// Đếm số lượng ảnh trong cache
  Future<int> getCacheCount();
}
