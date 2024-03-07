import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:flutterrealtimechatsockets/core/di/injection_container.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutterrealtimechatsockets/core/l10n/generated/l10n.dart';
import 'package:flutterrealtimechatsockets/core/router/app_routes.dart';
import 'package:flutterrealtimechatsockets/features/login/presentation/provider/auth_service.dart';
import 'package:flutterrealtimechatsockets/features/register/presentation/provider/register_service.dart';
import 'package:flutterrealtimechatsockets/features/loading/presentation/provider/loading_service.dart';

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
        ChangeNotifierProvider(
            create: (_) => injectionContainerImpl.sl<AuthService>()),
        ChangeNotifierProvider(
            create: (_) => injectionContainerImpl.sl<RegisterService>()),
        ChangeNotifierProvider(
            create: (_) => injectionContainerImpl.sl<LoadingService>()),
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
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        L10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routerConfig: router,
    );
  }
}
