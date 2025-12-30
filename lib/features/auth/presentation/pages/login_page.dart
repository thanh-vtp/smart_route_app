import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/core.dart';
import 'package:smart_route_app/core/ui/widgets/btn_child.dart';
import 'package:smart_route_app/features/auth/presentation/providers/states/auth.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');
    final login = useState<Future<void>?>(null);
    final loginSnap = useFuture(login.value);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: context.height * 0.24),
            Text('Login', style: context.textTheme.headlineMedium),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: loginSnap.isWaiting
                  ? null
                  : () async {
                      // TODO: Implement email/password login
                      // login.value = ref.read(authProvider.notifier).signInWithEmail(...);
                    },
              child: BtnChild(
                loading: loginSnap.isWaiting,
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 20),
            // Divider
            Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('OR', style: context.textTheme.bodyMedium),
                ),
                const Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 20),
            // Google Sign In Button
            OutlinedButton.icon(
              onPressed: () async {
                await ref.read(authProvider.notifier).signInWithGoogle();
              },
              icon: const Icon(Icons.login),
              label: const Text('Sign in with Google'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
