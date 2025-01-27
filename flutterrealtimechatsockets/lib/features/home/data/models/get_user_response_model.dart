import 'dart:convert';

import 'package:flutterrealtimechatsockets/features/home/data/models/user_response_model.dart';
import 'package:flutterrealtimechatsockets/features/home/domain/entities/get_user_response.dart';
import 'package:flutterrealtimechatsockets/features/home/domain/entities/user_response.dart';

class GetUsersResponseModel extends GetUsersResponse {
  final List<UserResponseModel> userResponseModelList;
  const GetUsersResponseModel({
    required super.ok,
    required this.userResponseModelList,
    required super.from,
  }) : super(users: userResponseModelList);

  GetUsersResponse copyWith({
    bool? ok,
    List<UserResponse>? users,
    int? from,
  }) {
    return GetUsersResponse(
      ok: ok ?? this.ok,
      users: users ?? this.users,
      from: from ?? this.from,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ok': ok,
      'users': userResponseModelList.map((x) => x.toMap()).toList(),
      'from': from,
    };
  }

  factory GetUsersResponseModel.fromMap(Map<String, dynamic> map) {
    return GetUsersResponseModel(
      ok: map['ok'] ?? false,
      userResponseModelList: List<UserResponseModel>.from(
          map['users']?.map((x) => UserResponseModel.fromMap(x))),
      from: map['from']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetUsersResponseModel.fromJson(String source) =>
      GetUsersResponseModel.fromMap(json.decode(source));

  @override
  String toString() => 'GetUsersResponse(ok: $ok, users: $users, from: $from)';
}
