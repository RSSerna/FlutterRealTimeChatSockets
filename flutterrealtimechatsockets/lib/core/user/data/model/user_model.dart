import 'dart:convert';

import 'package:flutterrealtimechatsockets/core/user/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.name,
    required super.email,
    required super.online,
    required super.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'online': online,
      'uid': uid,
    };
  }

  factory UserModel.fromMapBulletproff(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      online: map['online'] ?? false,
      uid: map['uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        online: json["online"],
      );
}
