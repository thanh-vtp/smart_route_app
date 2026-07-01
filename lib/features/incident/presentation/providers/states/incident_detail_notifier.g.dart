// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(IncidentDetailNotifier)
final incidentDetailProvider = IncidentDetailNotifierFamily._();

final class IncidentDetailNotifierProvider
    extends $NotifierProvider<IncidentDetailNotifier, IncidentDetailState> {
  IncidentDetailNotifierProvider._({
    required IncidentDetailNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'incidentDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$incidentDetailNotifierHash();

  @override
  String toString() {
    return r'incidentDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  IncidentDetailNotifier create() => IncidentDetailNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IncidentDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IncidentDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IncidentDetailNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$incidentDetailNotifierHash() =>
    r'262bdd1fb9d02c08c9a04c96fa0016d177ccbd31';

final class IncidentDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          IncidentDetailNotifier,
          IncidentDetailState,
          IncidentDetailState,
          IncidentDetailState,
          String
        > {
  IncidentDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'incidentDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IncidentDetailNotifierProvider call(String incidentId) =>
      IncidentDetailNotifierProvider._(argument: incidentId, from: this);

  @override
  String toString() => r'incidentDetailProvider';
}

abstract class _$IncidentDetailNotifier extends $Notifier<IncidentDetailState> {
  late final _$args = ref.$arg as String;
  String get incidentId => _$args;

  IncidentDetailState build(String incidentId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<IncidentDetailState, IncidentDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<IncidentDetailState, IncidentDetailState>,
              IncidentDetailState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
