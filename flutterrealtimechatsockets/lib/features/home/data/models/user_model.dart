import 'dart:convert';

import 'package:flutterrealtimechatsockets/features/home/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.online,
      required super.email,
      required super.name,
      required super.uid});

  Map<String, dynamic> toMap() => {
        "online": online,
        "name": name,
        "emai": email,
        "uid": uid,
      };

  factory UserModel.fromJson(String str) => UserModel.fromMap(
        json.decode(str),
      );

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        online: json["online"],
      );
}
