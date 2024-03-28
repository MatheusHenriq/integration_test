import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:integrationtest/src/authentication/view/authentication_view.dart';
import 'package:riverpod/riverpod.dart';

final _key = GlobalKey<NavigatorState>();

enum AppRoute { splash, login, home }

final routerProvider = Provider<GoRouter>((ref) {
  //final authState = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    initialLocation: AuthenticationView.routeName, // '/',
    //refreshListenable: authState,
    routes: [
      GoRoute(
        path: AuthenticationView.routeName,
        name: AuthenticationView.routeName,
        builder: (context, state) {
          return const AuthenticationView();
        },
      ),
    ],
    redirect: (context, state) {
      // final isAuthenticated = authState.isLoggedIn;
      // if (state.fullPath == '/${AppRoute.login.name}') {
      //   return isAuthenticated ? null : '/${AppRoute.login.name}';
      // }
      // return isAuthenticated ? null : '/${AppRoute.splash.name}';
    },
  );
});
