import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/presentation/providers/auth_provider.dart';

part 'auth.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AppUser build() {
    // 1. Lấy UseCase lắng nghe trạng thái
    final authStateChangesUseCase = ref.watch(
      getAuthStateChangesUsecaseProvider,
    );
    final currentUserUseCase = ref.watch(getCurrentUserUsecaseProvider);

    // 2. Đăng ký lắng nghe Stream từ Domain
    final subscription = authStateChangesUseCase.call().listen((appUser) {
      // Cập nhật state khi Domain báo có thay đổi
      state = appUser;
    });

    // 3. Dọn dẹp khi provider bị hủy
    ref.onDispose(() {
      subscription.cancel();
    });

    // 4. Giá trị khởi tạo: Lấy user hiện tại từ Domain
    return currentUserUseCase.call();
  }

  // --- CÁC HÀNH ĐỘNG (ACTIONS) ---

  // Đăng nhập Google
  Future<void> signInWithGoogle() async {
    try {
      final useCase = ref.read(signInWithGoogleUsecaseProvider);
      await useCase.call();
    } catch (e) {
      debugPrint("Lỗi Controller: $e");
      rethrow;
    }
  }

  // Đăng xuất
  Future<void> signOut() async {
    final useCase = ref.read(signOutUsecaseProvider);
    await useCase.call();
  }

  // (Nếu bạn muốn thêm đăng nhập email/pass, hãy tạo UseCase cho nó)
  // Future<void> loginWithEmail(String email, String pass) async { ... }
}
