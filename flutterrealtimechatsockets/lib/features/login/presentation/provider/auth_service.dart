import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterrealtimechatsockets/core/global/environments.dart';
import 'package:flutterrealtimechatsockets/core/user/domain/entities/user.dart';
import 'package:flutterrealtimechatsockets/features/login/data/models/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthService with ChangeNotifier {
  User? user;
  bool _authenticating = false;

  bool get authenticating => _authenticating;

  set authenticating(bool value) {
    _authenticating = value;
    notifyListeners();
  }

  Future login(String email, String password) async {
    authenticating = true;
    final data = {"email": email.trim(), "password": password.trim()};
    final Response res = await http.post(
      Uri.http(Environments.apiUrl, '/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    print(res.body);
    if (res.statusCode == 200) {
      final loginResponse = LoginResponseModel.fromJson(res.body);
      user = loginResponse.userModel;
    }
    authenticating = false;
  }
}
