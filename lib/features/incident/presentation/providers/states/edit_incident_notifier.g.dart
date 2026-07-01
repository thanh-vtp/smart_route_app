// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_incident_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EditIncidentNotifier)
final editIncidentProvider = EditIncidentNotifierProvider._();

final class EditIncidentNotifierProvider
    extends $NotifierProvider<EditIncidentNotifier, EditIncidentState> {
  EditIncidentNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editIncidentProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editIncidentNotifierHash();

  @$internal
  @override
  EditIncidentNotifier create() => EditIncidentNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EditIncidentState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EditIncidentState>(value),
    );
  }
}

String _$editIncidentNotifierHash() =>
    r'845c0b5c0ec6a102d261b5b19f41406fd9996026';

abstract class _$EditIncidentNotifier extends $Notifier<EditIncidentState> {
  EditIncidentState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<EditIncidentState, EditIncidentState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EditIncidentState, EditIncidentState>,
              EditIncidentState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
