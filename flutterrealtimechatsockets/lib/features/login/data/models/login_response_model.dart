import 'dart:convert';

import 'package:flutterrealtimechatsockets/core/user/data/model/user_model.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/entities/login_response.dart';

class LoginResponseModel extends LoginResponse {
  final UserModel userModel;

  const LoginResponseModel({
    required super.ok,
    required this.userModel,
    required super.token,
  }) : super(userDb: userModel);

  Map<String, dynamic> toMap() {
    return {
      'ok': ok,
      'userDb': userModel.toMap(),
      'token': token,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      ok: map['ok'] ?? false,
      userModel: UserModel.fromMap(map['userDb']),
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source));
}
