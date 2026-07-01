// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'use_case_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getNotificationsUseCase)
final getNotificationsUseCaseProvider = GetNotificationsUseCaseProvider._();

final class GetNotificationsUseCaseProvider
    extends
        $FunctionalProvider<
          GetNotificationsUseCase,
          GetNotificationsUseCase,
          GetNotificationsUseCase
        >
    with $Provider<GetNotificationsUseCase> {
  GetNotificationsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getNotificationsUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getNotificationsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetNotificationsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetNotificationsUseCase create(Ref ref) {
    return getNotificationsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetNotificationsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetNotificationsUseCase>(value),
    );
  }
}

String _$getNotificationsUseCaseHash() =>
    r'fe5b99496160ef71d03c61c686e9b216ea73ae71';

@ProviderFor(markNotificationReadUseCase)
final markNotificationReadUseCaseProvider =
    MarkNotificationReadUseCaseProvider._();

final class MarkNotificationReadUseCaseProvider
    extends
        $FunctionalProvider<
          MarkNotificationReadUseCase,
          MarkNotificationReadUseCase,
          MarkNotificationReadUseCase
        >
    with $Provider<MarkNotificationReadUseCase> {
  MarkNotificationReadUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'markNotificationReadUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$markNotificationReadUseCaseHash();

  @$internal
  @override
  $ProviderElement<MarkNotificationReadUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MarkNotificationReadUseCase create(Ref ref) {
    return markNotificationReadUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MarkNotificationReadUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MarkNotificationReadUseCase>(value),
    );
  }
}

String _$markNotificationReadUseCaseHash() =>
    r'e4098f146a31b6dcbc15df5c78e7e959fadd45ab';

@ProviderFor(markAllNotificationsReadUseCase)
final markAllNotificationsReadUseCaseProvider =
    MarkAllNotificationsReadUseCaseProvider._();

final class MarkAllNotificationsReadUseCaseProvider
    extends
        $FunctionalProvider<
          MarkAllNotificationsReadUseCase,
          MarkAllNotificationsReadUseCase,
          MarkAllNotificationsReadUseCase
        >
    with $Provider<MarkAllNotificationsReadUseCase> {
  MarkAllNotificationsReadUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'markAllNotificationsReadUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$markAllNotificationsReadUseCaseHash();

  @$internal
  @override
  $ProviderElement<MarkAllNotificationsReadUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MarkAllNotificationsReadUseCase create(Ref ref) {
    return markAllNotificationsReadUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MarkAllNotificationsReadUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MarkAllNotificationsReadUseCase>(
        value,
      ),
    );
  }
}

String _$markAllNotificationsReadUseCaseHash() =>
    r'82b0110dc836e1d4ae7c10914c006340e5f6b5e7';
