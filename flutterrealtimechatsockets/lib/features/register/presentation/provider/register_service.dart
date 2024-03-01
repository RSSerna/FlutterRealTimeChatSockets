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

  Future login(String name, String email, String password) async {
    registering = true;

    final failureOrRegister = await tryRegister(
        RegisterParams(name: name, email: email, password: password));

    failureOrRegister.fold((failure) {}, (logInResponse) {
      user = logInResponse.userDb;
    });

    registering = false;
  }
}
