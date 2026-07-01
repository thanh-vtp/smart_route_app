// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_incident_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReportIncidentNotifier)
final reportIncidentProvider = ReportIncidentNotifierProvider._();

final class ReportIncidentNotifierProvider
    extends $NotifierProvider<ReportIncidentNotifier, ReportIncidentState> {
  ReportIncidentNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportIncidentProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportIncidentNotifierHash();

  @$internal
  @override
  ReportIncidentNotifier create() => ReportIncidentNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportIncidentState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportIncidentState>(value),
    );
  }
}

String _$reportIncidentNotifierHash() =>
    r'563bd87e214689326f57fe403030cc8bce0e6a14';

abstract class _$ReportIncidentNotifier extends $Notifier<ReportIncidentState> {
  ReportIncidentState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ReportIncidentState, ReportIncidentState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ReportIncidentState, ReportIncidentState>,
              ReportIncidentState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
