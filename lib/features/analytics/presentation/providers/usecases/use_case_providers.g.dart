// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'use_case_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getAnalyticsUsecase)
final getAnalyticsUsecaseProvider = GetAnalyticsUsecaseProvider._();

final class GetAnalyticsUsecaseProvider
    extends
        $FunctionalProvider<
          GetAnalyticsUsecase,
          GetAnalyticsUsecase,
          GetAnalyticsUsecase
        >
    with $Provider<GetAnalyticsUsecase> {
  GetAnalyticsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAnalyticsUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAnalyticsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetAnalyticsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetAnalyticsUsecase create(Ref ref) {
    return getAnalyticsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetAnalyticsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetAnalyticsUsecase>(value),
    );
  }
}

String _$getAnalyticsUsecaseHash() =>
    r'7a3e8b8351941de15e74c0716341b94741d1a792';
