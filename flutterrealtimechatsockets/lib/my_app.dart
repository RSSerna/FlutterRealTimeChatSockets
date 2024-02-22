
import 'package:flutter/material.dart';
import 'package:flutterrealtimechatsockets/core/di/injection_container.dart';
import 'package:flutterrealtimechatsockets/core/router/app_routes.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';


class AppState extends StatelessWidget {
  final InjectionContainerImpl injectionContainerImpl;

  const AppState({
    super.key,
    required this.injectionContainerImpl,
  });

  @override
  Widget build(BuildContext context) {
    return MainApp();
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider<SocketServiceBloc>(
    //       create: (BuildContext context) =>
    //           injectionContainerImpl.sl<SocketServiceBloc>(),
    //     ),
    //     BlocProvider<BandsBloc>(
    //       create: (BuildContext context) =>
    //           injectionContainerImpl.sl<BandsBloc>(),
    //     ),
    //   ],
    //   child: const MainApp(),
    // );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routerConfig: router,
    );
  }
}
