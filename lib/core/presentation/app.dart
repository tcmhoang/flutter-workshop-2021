import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../auth/application/auth_notifer.dart';
import '../../auth/shared/provider.dart';
import '../shared/provider.dart';
import 'routes/app_router.gr.dart';

final initializationProvider = FutureProvider<Unit>((ref) async {
  await ref.read(sembastProvider).init();
  final authNotifier = ref.read(authNotifierProvider.notifier);
  await authNotifier.checkAndUpdateAuthStatus();
  return unit;
});

class App extends ConsumerWidget {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (_) {});
    ref.listen<AuthState>(authNotifierProvider, (state) {
      state.maybeMap(
        orElse: () {},
        authenticated: (_) => appRouter.pushAndPopUntil(
          const StarredReposRoute(),
          predicate: (_) => false,
        ),
        unauthenticated: (_) => appRouter.pushAndPopUntil(
          const SignInRoute(),
          predicate: (_) => false,
        ),
      );
    });
    return MaterialApp.router(
      title: 'Repositories Viewer',
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
