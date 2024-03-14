import 'package:flutter/material.dart';
import 'package:flutterrealtimechatsockets/core/functionalSocket/functional_socket.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/entities/login_params.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/usecases/try_login.dart';

class LoginService with ChangeNotifier {
  bool _authenticating = false;
  bool get authenticating => _authenticating;
  set authenticating(bool value) {
    _authenticating = value;
    notifyListeners();
  }

  final TryLogIn tryLogIn;
  final FunctionalSocket functionalSocket;

  LoginService({required this.tryLogIn, required this.functionalSocket});

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
      functionalSocket.connect();
    });
    print('Send True');
    return ok;
  }
}
