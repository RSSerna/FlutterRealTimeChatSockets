import 'dart:convert';

import 'package:flutterrealtimechatsockets/core/user/data/model/user_model.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/entities/login_response.dart';

class LogInResponseModel extends LogInResponse {
  final UserModel userModel;

  const LogInResponseModel({
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

  factory LogInResponseModel.fromMap(Map<String, dynamic> map) {
    return LogInResponseModel(
      ok: map['ok'],
      userModel: UserModel.fromMap(map['userDb']),
      token: map['token'],
    );
  }
  
  factory LogInResponseModel.fromMapBulletproof(Map<String, dynamic> map) {
    return LogInResponseModel(
      ok: map['ok'] ?? false,
      userModel: UserModel.fromMap(map['userDb']),
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LogInResponseModel.fromJson(String source) =>
      LogInResponseModel.fromMap(json.decode(source));
}
