import 'dart:convert';

import 'package:flutterrealtimechatsockets/core/user/data/model/user_model.dart';
import 'package:flutterrealtimechatsockets/features/register/domain/entities/register_response.dart';

class RegisterResponseModel extends RegisterResponse {
  final UserModel userModel;

  const RegisterResponseModel({
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

  factory RegisterResponseModel.fromMap(Map<String, dynamic> map) {
    return RegisterResponseModel(
      ok: map['ok'],
      userModel: UserModel.fromMap(map['userDb']),
      token: map['token'],
    );
  }
  
  factory RegisterResponseModel.fromMapBulletproof(Map<String, dynamic> map) {
    return RegisterResponseModel(
      ok: map['ok'] ?? false,
      userModel: UserModel.fromMap(map['userDb']),
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterResponseModel.fromJson(String source) =>
      RegisterResponseModel.fromMap(json.decode(source));
}
