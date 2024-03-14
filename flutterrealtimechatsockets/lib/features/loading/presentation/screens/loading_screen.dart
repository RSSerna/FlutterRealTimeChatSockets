import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutterrealtimechatsockets/core/constants/router_paths.dart';
import 'package:flutterrealtimechatsockets/features/loading/presentation/provider/loading_service.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: checkLoginState(context),
          builder: (context, snapshot) {
            return const Center(
              child: SizedBox(
                width: 200,
                child: Image(image: AssetImage('assets/tag-logo.png')),
              ),
            );
          }),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final loadingService = Provider.of<LoadingService>(context, listen: false);
    final isAuthenticated = await loadingService.isLoggedIn();
    print(isAuthenticated);
    context.go(isAuthenticated ? RouterPaths.home : RouterPaths.login);
  }
}
