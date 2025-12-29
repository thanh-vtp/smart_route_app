// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_info_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$internetConnectionCheckerHash() =>
    r'e1e55441d0887ab8db58716ea3da033409d46b26';

/// See also [internetConnectionChecker].
@ProviderFor(internetConnectionChecker)
final internetConnectionCheckerProvider =
    Provider<InternetConnectionChecker>.internal(
  internetConnectionChecker,
  name: r'internetConnectionCheckerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$internetConnectionCheckerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef InternetConnectionCheckerRef = ProviderRef<InternetConnectionChecker>;
String _$networkInfoHash() => r'760b5471112c37b3eacf66bd9da8a02cee4c1bef';

/// See also [networkInfo].
@ProviderFor(networkInfo)
final networkInfoProvider = Provider<NetworkInfo>.internal(
  networkInfo,
  name: r'networkInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$networkInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NetworkInfoRef = ProviderRef<NetworkInfo>;
String _$internetConnectionStreamHash() =>
    r'effeafd2e731f9b8423c19c02359127327a00632';

/// See also [internetConnectionStream].
@ProviderFor(internetConnectionStream)
final internetConnectionStreamProvider =
    AutoDisposeStreamProvider<bool>.internal(
  internetConnectionStream,
  name: r'internetConnectionStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$internetConnectionStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef InternetConnectionStreamRef = AutoDisposeStreamProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
