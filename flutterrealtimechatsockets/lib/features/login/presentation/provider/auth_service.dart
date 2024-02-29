import 'package:flutter/material.dart';

import 'package:flutterrealtimechatsockets/features/login/domain/entities/login_params.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/usecases/try_login.dart';
import 'package:flutterrealtimechatsockets/core/user/domain/entities/user.dart';

class AuthService with ChangeNotifier {
  User? user;

  bool _authenticating = false;
  bool get authenticating => _authenticating;
  set authenticating(bool value) {
    _authenticating = value;
    notifyListeners();
  }

  final TryLogIn tryLogIn;

  AuthService({required this.tryLogIn});

  Future login(String email, String password) async {
    authenticating = true;

    final failureOrLogIn = await tryLogIn(
        LogInParams(email: email.trim(), password: password.trim()));

    failureOrLogIn.fold((failure) {}, (logInResponse) {
      user = logInResponse.userDb;
    });

    authenticating = false;
  }
}
