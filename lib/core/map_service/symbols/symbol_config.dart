class SymbolConfig {
  final double size;

  final double offsetY;

  const SymbolConfig({required this.size, required this.offsetY});

  factory SymbolConfig.defaultMarker() {
    return const SymbolConfig(size: 50, offsetY: 16); // 32/16
  }

  factory SymbolConfig.highlight() {
    return const SymbolConfig(size: 50, offsetY: 25); // 50/25
  }
}
