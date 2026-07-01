// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'use_case_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(calculateRouteUseCase)
final calculateRouteUseCaseProvider = CalculateRouteUseCaseProvider._();

final class CalculateRouteUseCaseProvider
    extends
        $FunctionalProvider<
          CalculateRouteUseCase,
          CalculateRouteUseCase,
          CalculateRouteUseCase
        >
    with $Provider<CalculateRouteUseCase> {
  CalculateRouteUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calculateRouteUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calculateRouteUseCaseHash();

  @$internal
  @override
  $ProviderElement<CalculateRouteUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CalculateRouteUseCase create(Ref ref) {
    return calculateRouteUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CalculateRouteUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CalculateRouteUseCase>(value),
    );
  }
}

String _$calculateRouteUseCaseHash() =>
    r'069206b9f442b638c0937d98afe5a27563e59eb7';

@ProviderFor(calculateAlternativeRoutesUseCase)
final calculateAlternativeRoutesUseCaseProvider =
    CalculateAlternativeRoutesUseCaseProvider._();

final class CalculateAlternativeRoutesUseCaseProvider
    extends
        $FunctionalProvider<
          CalculateAlternativeRoutesUseCase,
          CalculateAlternativeRoutesUseCase,
          CalculateAlternativeRoutesUseCase
        >
    with $Provider<CalculateAlternativeRoutesUseCase> {
  CalculateAlternativeRoutesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calculateAlternativeRoutesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$calculateAlternativeRoutesUseCaseHash();

  @$internal
  @override
  $ProviderElement<CalculateAlternativeRoutesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CalculateAlternativeRoutesUseCase create(Ref ref) {
    return calculateAlternativeRoutesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CalculateAlternativeRoutesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CalculateAlternativeRoutesUseCase>(
        value,
      ),
    );
  }
}

String _$calculateAlternativeRoutesUseCaseHash() =>
    r'41104a04bff004184312e1c2abc199a0a4fb6783';
