import 'package:flutter/material.dart';
import 'package:flutterrealtimechatsockets/core/user/domain/entities/user.dart';
import 'package:flutterrealtimechatsockets/features/register/domain/entities/register_params.dart';
import 'package:flutterrealtimechatsockets/features/register/domain/usecases/try_register.dart';

class RegisterService with ChangeNotifier {
  User? user;

  bool _registering = false;
  bool get registering => _registering;
  set registering(bool value) {
    _registering = value;
    notifyListeners();
  }

  final TryRegister tryRegister;

  RegisterService({required this.tryRegister});

  Future<bool> register(String name, String email, String password) async {
    registering = true;
    final failureOrRegister = await tryRegister(
        RegisterParams(name: name, email: email, password: password));
    registering = false;

    bool ok = true;
    failureOrRegister.fold((failure) {
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
