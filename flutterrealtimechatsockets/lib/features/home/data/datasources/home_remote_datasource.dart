// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutterrealtimechatsockets/core/constants/api.dart';
import 'package:flutterrealtimechatsockets/core/errors/exceptions.dart';
import 'package:flutterrealtimechatsockets/core/http/custom_http_client.dart';
import 'package:flutterrealtimechatsockets/core/http/petition_response.dart';
import 'package:flutterrealtimechatsockets/features/home/data/models/get_user_response_model.dart';
import 'package:flutterrealtimechatsockets/features/home/domain/entities/home_internal_token.dart';
import 'package:flutterrealtimechatsockets/features/home/domain/entities/user_response.dart';

abstract class HomeRemoteDatasource {
  Future<List<UserResponse>> getUsers(
      {required HomeInternalToken chatInternalToken});
}

class HomeRemoteDatasourceImpl extends HomeRemoteDatasource {
  final CustomHttpClient client;
  HomeRemoteDatasourceImpl({required this.client});
  @override
  Future<List<UserResponse>> getUsers(
      {required HomeInternalToken chatInternalToken}) async {
    print("Try Log In");
    final PetitionResponse response = await client.post(
      API.apiGetUsers,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    Map<String, dynamic> jsonData = json.decode(response.data);
    print(response.data);
    if (response.statusCode == 200) {
      try {
        final getUsersResponseModel = GetUsersResponseModel.fromMap(jsonData);

        return getUsersResponseModel.users;
      } catch (e) {
        throw const ModelException(message: "Can't create LogIn Model");
      }
    }
    throw ServerException(errorCode: response.statusCode);
  }
}
