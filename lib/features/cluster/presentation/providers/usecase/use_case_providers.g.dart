// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'use_case_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchClusterUseCase)
final fetchClusterUseCaseProvider = FetchClusterUseCaseProvider._();

final class FetchClusterUseCaseProvider
    extends
        $FunctionalProvider<
          FetchClusterUseCase,
          FetchClusterUseCase,
          FetchClusterUseCase
        >
    with $Provider<FetchClusterUseCase> {
  FetchClusterUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchClusterUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchClusterUseCaseHash();

  @$internal
  @override
  $ProviderElement<FetchClusterUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FetchClusterUseCase create(Ref ref) {
    return fetchClusterUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchClusterUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchClusterUseCase>(value),
    );
  }
}

String _$fetchClusterUseCaseHash() =>
    r'0981342c01ceb362c3a4a67bf73f11b830ef162a';
