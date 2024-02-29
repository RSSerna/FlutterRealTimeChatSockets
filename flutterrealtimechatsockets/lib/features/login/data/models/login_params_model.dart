import 'dart:convert';

import 'package:flutterrealtimechatsockets/features/login/domain/entities/login_params.dart';

class LogInParamsModel extends LogInParams {
  const LogInParamsModel({required super.email, required super.password});
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LogInParamsModel.fromMap(Map<String, dynamic> map) {
    return LogInParamsModel(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LogInParamsModel.fromJson(String source) =>
      LogInParamsModel.fromMap(json.decode(source));
}
