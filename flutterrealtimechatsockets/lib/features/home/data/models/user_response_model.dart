import 'dart:convert';

import 'package:flutterrealtimechatsockets/features/home/domain/entities/user_response.dart';

class UserResponseModel extends UserResponse {
  const UserResponseModel({
    required super.name,
    required super.email,
    required super.online,
    required super.uid,
  });

  UserResponse copyWith({
    String? name,
    String? email,
    bool? online,
    String? uid,
  }) {
    return UserResponse(
      name: name ?? this.name,
      email: email ?? this.email,
      online: online ?? this.online,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'online': online,
      'uid': uid,
    };
  }

  factory UserResponseModel.fromMap(Map<String, dynamic> map) {
    return UserResponseModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      online: map['online'] ?? false,
      uid: map['uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResponseModel.fromJson(String source) =>
      UserResponseModel.fromMap(json.decode(source));
}
