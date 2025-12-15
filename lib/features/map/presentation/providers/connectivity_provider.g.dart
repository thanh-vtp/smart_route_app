// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$internetStatusNotifierHash() =>
    r'903011a7c749d22518216ab7b7939d14a748ffa0';

/// Provider theo dõi trạng thái internet realtime
///
/// Copied from [InternetStatusNotifier].
@ProviderFor(InternetStatusNotifier)
final internetStatusNotifierProvider = AutoDisposeNotifierProvider<
    InternetStatusNotifier, InternetStatus>.internal(
  InternetStatusNotifier.new,
  name: r'internetStatusNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$internetStatusNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$InternetStatusNotifier = AutoDisposeNotifier<InternetStatus>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
