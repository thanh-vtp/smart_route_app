// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_datasource_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(analyticsRemoteDataSource)
final analyticsRemoteDataSourceProvider = AnalyticsRemoteDataSourceProvider._();

final class AnalyticsRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          AnalyticsRemoteDataSource,
          AnalyticsRemoteDataSource,
          AnalyticsRemoteDataSource
        >
    with $Provider<AnalyticsRemoteDataSource> {
  AnalyticsRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'analyticsRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$analyticsRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<AnalyticsRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AnalyticsRemoteDataSource create(Ref ref) {
    return analyticsRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AnalyticsRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AnalyticsRemoteDataSource>(value),
    );
  }
}

String _$analyticsRemoteDataSourceHash() =>
    r'191425ffbde7a56c9b883396205af4b23a8fe836';
