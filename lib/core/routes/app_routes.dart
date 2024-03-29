import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:integrationtest/src/authentication/view/authentication_view.dart';
import 'package:integrationtest/src/home/view/home_view.dart';
import 'package:riverpod/riverpod.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    debugLogDiagnostics: true,
    initialLocation: AuthenticationView.routeName, // '/',
    routes: [
      GoRoute(
        path: AuthenticationView.routeName,
        name: AuthenticationView.routeName,
        builder: (context, state) {
          return AuthenticationView();
        },
      ),
      GoRoute(
        path: HomeView.routeName,
        name: HomeView.routeName,
        builder: (context, state) {
          return const HomeView();
        },
      ),
    ],
  );
});
