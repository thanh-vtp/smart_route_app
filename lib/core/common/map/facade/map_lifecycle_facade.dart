abstract interface class MapLifecycleFacade {
  Future<void> initialize();

  void dispose();
}
