import 'dart:convert';

import 'package:flutterrealtimechatsockets/core/user/data/model/user_model.dart';
import 'package:flutterrealtimechatsockets/features/loading/domain/entities/token_response.dart';

class TokenResponseModel extends TokenResponse {
  final UserModel userModel;

  const TokenResponseModel({
    required super.ok,
    required this.userModel,
    required super.token,
  }) : super(userDB: userModel);

  Map<String, dynamic> toMap() {
    return {
      'ok': ok,
      'userDB': userModel.toMap(),
      'token': token,
    };
  }
  
  factory TokenResponseModel.fromMap(Map<String, dynamic> map) {
    return TokenResponseModel(
      ok: map['ok'] ?? false,
      userModel: UserModel.fromMap(map['userDB']),
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenResponseModel.fromJson(String source) =>
      TokenResponseModel.fromMap(json.decode(source));
}
