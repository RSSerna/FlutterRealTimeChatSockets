import 'dart:convert';

import 'package:flutterrealtimechatsockets/features/register/domain/entities/register_params.dart';

class RegisterParamsModel extends RegisterParams {
  const RegisterParamsModel({required super.name, required super.email, required super.password});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory RegisterParamsModel.fromMap(Map<String, dynamic> map) {
    return RegisterParamsModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterParamsModel.fromJson(String source) =>
      RegisterParamsModel.fromMap(json.decode(source));
}
