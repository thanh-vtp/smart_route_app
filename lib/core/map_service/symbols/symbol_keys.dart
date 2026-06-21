/// Tránh việc hardcode các key cho Symbol, giúp dễ bảo trì và tránh lỗi typo
abstract final class SymbolKeys {
  static const highlight = 'highlight';

  static const other = 'other';

  static String incident(String typeId, double size) {
    return '${typeId}_$size';
  }
}
