// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$incidentDetailNotifierHash() =>
    r'391e6fa881a23c5da89be4ab612e381432da2beb';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$IncidentDetailNotifier
    extends BuildlessAutoDisposeNotifier<IncidentDetailState> {
  late final String incidentId;

  IncidentDetailState build(
    String incidentId,
  );
}

/// See also [IncidentDetailNotifier].
@ProviderFor(IncidentDetailNotifier)
const incidentDetailNotifierProvider = IncidentDetailNotifierFamily();

/// See also [IncidentDetailNotifier].
class IncidentDetailNotifierFamily extends Family<IncidentDetailState> {
  /// See also [IncidentDetailNotifier].
  const IncidentDetailNotifierFamily();

  /// See also [IncidentDetailNotifier].
  IncidentDetailNotifierProvider call(
    String incidentId,
  ) {
    return IncidentDetailNotifierProvider(
      incidentId,
    );
  }

  @override
  IncidentDetailNotifierProvider getProviderOverride(
    covariant IncidentDetailNotifierProvider provider,
  ) {
    return call(
      provider.incidentId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'incidentDetailNotifierProvider';
}

/// See also [IncidentDetailNotifier].
class IncidentDetailNotifierProvider extends AutoDisposeNotifierProviderImpl<
    IncidentDetailNotifier, IncidentDetailState> {
  /// See also [IncidentDetailNotifier].
  IncidentDetailNotifierProvider(
    String incidentId,
  ) : this._internal(
          () => IncidentDetailNotifier()..incidentId = incidentId,
          from: incidentDetailNotifierProvider,
          name: r'incidentDetailNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$incidentDetailNotifierHash,
          dependencies: IncidentDetailNotifierFamily._dependencies,
          allTransitiveDependencies:
              IncidentDetailNotifierFamily._allTransitiveDependencies,
          incidentId: incidentId,
        );

  IncidentDetailNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.incidentId,
  }) : super.internal();

  final String incidentId;

  @override
  IncidentDetailState runNotifierBuild(
    covariant IncidentDetailNotifier notifier,
  ) {
    return notifier.build(
      incidentId,
    );
  }

  @override
  Override overrideWith(IncidentDetailNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: IncidentDetailNotifierProvider._internal(
        () => create()..incidentId = incidentId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        incidentId: incidentId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<IncidentDetailNotifier,
      IncidentDetailState> createElement() {
    return _IncidentDetailNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IncidentDetailNotifierProvider &&
        other.incidentId == incidentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, incidentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IncidentDetailNotifierRef
    on AutoDisposeNotifierProviderRef<IncidentDetailState> {
  /// The parameter `incidentId` of this provider.
  String get incidentId;
}

class _IncidentDetailNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<IncidentDetailNotifier,
        IncidentDetailState> with IncidentDetailNotifierRef {
  _IncidentDetailNotifierProviderElement(super.provider);

  @override
  String get incidentId =>
      (origin as IncidentDetailNotifierProvider).incidentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
