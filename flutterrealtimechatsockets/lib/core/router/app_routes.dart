import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutterrealtimechatsockets/core/constants/router_paths.dart';
import 'package:flutterrealtimechatsockets/core/router/routes.dart';

final router = GoRouter(
  initialLocation: RouterPaths.home,
  routes: [
    //LogIn
    GoRoute(
      path: RouterPaths.login,
      builder: (BuildContext context, GoRouterState state) =>
          const LoginScreen(),
    ),
    //Register
    GoRoute(
      path: RouterPaths.register,
      builder: (BuildContext context, GoRouterState state) =>
          const RegisterScreen(),
    ),
    //Chat
    GoRoute(
      path: RouterPaths.chat,
      builder: (BuildContext context, GoRouterState state) =>
          const ChatScreen(),
    ),
    //home
    GoRoute(
      path: RouterPaths.home,
      builder: (BuildContext context, GoRouterState state) => HomeScreen(),
    ),
    //Loading
    GoRoute(
      path: RouterPaths.login,
      builder: (BuildContext context, GoRouterState state) =>
          const LoadingScreen(),
    ),
  ],
);
