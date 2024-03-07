import 'dart:convert';

import 'package:flutterrealtimechatsockets/features/loading/domain/entities/internal_token.dart';

class InternalTokenModel extends InternalToken {
  const InternalTokenModel({required super.token});

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory InternalTokenModel.fromMap(Map<String, dynamic> map) {
    return InternalTokenModel(
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InternalTokenModel.fromJson(String source) =>
      InternalTokenModel.fromMap(json.decode(source));
}
