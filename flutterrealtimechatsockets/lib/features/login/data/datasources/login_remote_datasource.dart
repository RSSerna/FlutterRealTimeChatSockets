import 'dart:convert';
import 'dart:io';

import 'package:flutterrealtimechatsockets/core/constants/api.dart';
import 'package:flutterrealtimechatsockets/core/constants/constants.dart';
import 'package:flutterrealtimechatsockets/core/errors/exceptions.dart';
import 'package:flutterrealtimechatsockets/core/http/custom_http_client.dart';
import 'package:flutterrealtimechatsockets/core/http/petition_response.dart';
import 'package:flutterrealtimechatsockets/core/secure_storage/secure_storage.dart';
import 'package:flutterrealtimechatsockets/features/login/data/models/login_params_model.dart';
import 'package:flutterrealtimechatsockets/features/login/data/models/login_response_model.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/entities/login_params.dart';

abstract class LogInRemoteDatasource {
  Future<LogInResponseModel> tryLogIn({required LogInParams loginParams});
}

class LogInRemoteDatasourceImpl extends LogInRemoteDatasource {
  final CustomHttpClient client;
  final SecureStorage secureStorage;
  LogInRemoteDatasourceImpl(
      {required this.client, required this.secureStorage});

  @override
  Future<LogInResponseModel> tryLogIn(
      {required LogInParams loginParams}) async {
    print("Try Log In");
    final PetitionResponse response = await client.post(
      API.apiLogIn,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: LogInParamsModel(
              email: loginParams.email, password: loginParams.password)
          .toJson(),
    );

    Map<String, dynamic> jsonData = json.decode(response.data);
    print(response.data);
    if (response.statusCode == 200) {
      try {
        final loginResponse = LogInResponseModel.fromMap(jsonData);
        secureStorage.write(
            key: Constants.securedToken, value: jsonData['token']);
        return loginResponse;
      } catch (e) {
        throw ModelException(message: "Can't create LogIn Model");
      }
    }
    throw ServerException(errorCode: response.statusCode);
  }
}
