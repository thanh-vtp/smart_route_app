import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/screens/provider/map_facade_provider.dart';

/// Provider để theo dõi trạng thái "đang theo dõi vị trí người dùng" (Auto Pan) của LocationDisplay
// final isFollowingUserProvider = StreamProvider.autoDispose<bool>((ref) {
//   final facade = ref.watch(mapFacadeProvider);

//   return facade.followLocationState();
// });
