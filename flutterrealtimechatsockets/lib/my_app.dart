import 'package:flutter/material.dart';
import 'package:flutterrealtimechatsockets/core/di/injection_container.dart';
import 'package:flutterrealtimechatsockets/core/router/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutterrealtimechatsockets/features/login/presentation/provider/auth_service.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class AppState extends StatelessWidget {
  final InjectionContainerImpl injectionContainerImpl;

  const AppState({
    super.key,
    required this.injectionContainerImpl,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routerConfig: router,
    );
  }
}
