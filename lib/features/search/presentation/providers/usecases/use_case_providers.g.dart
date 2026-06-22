// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'use_case_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Chuyển đổi địa chỉ thành tọa độ (geocoding)

@ProviderFor(geocodeAddressUseCase)
final geocodeAddressUseCaseProvider = GeocodeAddressUseCaseProvider._();

/// Chuyển đổi địa chỉ thành tọa độ (geocoding)

final class GeocodeAddressUseCaseProvider
    extends
        $FunctionalProvider<
          GeocodeAddressUseCase,
          GeocodeAddressUseCase,
          GeocodeAddressUseCase
        >
    with $Provider<GeocodeAddressUseCase> {
  /// Chuyển đổi địa chỉ thành tọa độ (geocoding)
  GeocodeAddressUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'geocodeAddressUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$geocodeAddressUseCaseHash();

  @$internal
  @override
  $ProviderElement<GeocodeAddressUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GeocodeAddressUseCase create(Ref ref) {
    return geocodeAddressUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GeocodeAddressUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GeocodeAddressUseCase>(value),
    );
  }
}

String _$geocodeAddressUseCaseHash() =>
    r'dd2e7472750e5414221b618c2dd4453b1bef92f8';

/// Chuyển đổi địa chỉ theo cấu trúc thành tọa độ (structured geocoding)

@ProviderFor(geocodeAddressStructuredUseCase)
final geocodeAddressStructuredUseCaseProvider =
    GeocodeAddressStructuredUseCaseProvider._();

/// Chuyển đổi địa chỉ theo cấu trúc thành tọa độ (structured geocoding)

final class GeocodeAddressStructuredUseCaseProvider
    extends
        $FunctionalProvider<
          GeocodeAddressStructuredUseCase,
          GeocodeAddressStructuredUseCase,
          GeocodeAddressStructuredUseCase
        >
    with $Provider<GeocodeAddressStructuredUseCase> {
  /// Chuyển đổi địa chỉ theo cấu trúc thành tọa độ (structured geocoding)
  GeocodeAddressStructuredUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'geocodeAddressStructuredUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$geocodeAddressStructuredUseCaseHash();

  @$internal
  @override
  $ProviderElement<GeocodeAddressStructuredUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GeocodeAddressStructuredUseCase create(Ref ref) {
    return geocodeAddressStructuredUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GeocodeAddressStructuredUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GeocodeAddressStructuredUseCase>(
        value,
      ),
    );
  }
}

String _$geocodeAddressStructuredUseCaseHash() =>
    r'9448be53471d74321f6c0fa6bca1194d12d4dd25';

/// Chuyển đổi tọa độ thành địa chỉ (reverse geocoding)

@ProviderFor(reverseGeocodeUseCase)
final reverseGeocodeUseCaseProvider = ReverseGeocodeUseCaseProvider._();

/// Chuyển đổi tọa độ thành địa chỉ (reverse geocoding)

final class ReverseGeocodeUseCaseProvider
    extends
        $FunctionalProvider<
          ReverseGeocodeUseCase,
          ReverseGeocodeUseCase,
          ReverseGeocodeUseCase
        >
    with $Provider<ReverseGeocodeUseCase> {
  /// Chuyển đổi tọa độ thành địa chỉ (reverse geocoding)
  ReverseGeocodeUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reverseGeocodeUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reverseGeocodeUseCaseHash();

  @$internal
  @override
  $ProviderElement<ReverseGeocodeUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReverseGeocodeUseCase create(Ref ref) {
    return reverseGeocodeUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReverseGeocodeUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReverseGeocodeUseCase>(value),
    );
  }
}

String _$reverseGeocodeUseCaseHash() =>
    r'5336fa33caafae7f3c72703780c6fc1401ffc737';
