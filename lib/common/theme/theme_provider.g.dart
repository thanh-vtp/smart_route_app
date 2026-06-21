// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeRepositoryHash() => r'c6f09801cb97182c744726327f16ace4c7c895bf';

/// Provider cho ThemeRepository
///
/// Copied from [themeRepository].
@ProviderFor(themeRepository)
final themeRepositoryProvider = AutoDisposeProvider<ThemeRepository>.internal(
  themeRepository,
  name: r'themeRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themeRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ThemeRepositoryRef = AutoDisposeProviderRef<ThemeRepository>;
String _$themeNotifierHash() => r'10de697394cf6ee0fef5959d2d558c147c52e0d6';

/// State notifier cho theme mode
///
/// Copied from [ThemeNotifier].
@ProviderFor(ThemeNotifier)
final themeNotifierProvider =
    AutoDisposeNotifierProvider<ThemeNotifier, ThemeMode>.internal(
  ThemeNotifier.new,
  name: r'themeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeNotifier = AutoDisposeNotifier<ThemeMode>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
