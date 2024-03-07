import 'package:flutter/material.dart';

import 'package:flutterrealtimechatsockets/features/login/domain/entities/login_params.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/usecases/try_login.dart';
import 'package:flutterrealtimechatsockets/core/user/domain/entities/user.dart';

class LoginService with ChangeNotifier {
  User? user;

  bool _authenticating = false;
  bool get authenticating => _authenticating;
  set authenticating(bool value) {
    _authenticating = value;
    notifyListeners();
  }

  final TryLogIn tryLogIn;

  LoginService({required this.tryLogIn});

  Future<bool> login(String email, String password) async {
    authenticating = true;

    final failureOrLogIn = await tryLogIn(
        LogInParams(email: email.trim(), password: password.trim()));

    authenticating = false;
    bool ok = true;
    failureOrLogIn.fold((failure) {
      print('Send False: ${failure.toString()}');
      ok = false;
      return false;
    }, (logInResponse) {
      user = logInResponse.userDb;
    });
    print('Send True');
    return ok;
  }
}
