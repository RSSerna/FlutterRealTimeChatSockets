import 'dart:convert';

import 'package:flutterrealtimechatsockets/features/home/domain/entities/home_internal_token.dart';

class HomeInternalTokenModel extends HomeInternalToken {
  const HomeInternalTokenModel({required super.token});

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory HomeInternalTokenModel.fromMap(Map<String, dynamic> map) {
    return HomeInternalTokenModel(
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeInternalTokenModel.fromJson(String source) =>
      HomeInternalTokenModel.fromMap(json.decode(source));
}
