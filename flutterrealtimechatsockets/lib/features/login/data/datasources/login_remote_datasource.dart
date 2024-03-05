import 'dart:io';

import 'package:flutterrealtimechatsockets/core/constants/api.dart';
import 'package:flutterrealtimechatsockets/core/errors/exceptions.dart';
import 'package:flutterrealtimechatsockets/core/http/custom_http_client.dart';
import 'package:flutterrealtimechatsockets/core/http/petition_response.dart';
import 'package:flutterrealtimechatsockets/features/login/data/models/login_params_model.dart';
import 'package:flutterrealtimechatsockets/features/login/data/models/login_response_model.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/entities/login_params.dart';

abstract class LogInRemoteDatasource {
  Future<LogInResponseModel> tryLogIn({required LogInParams loginParams});
}

class LogInRemoteDatasourceImpl extends LogInRemoteDatasource {
  final CustomHttpClient client;

  LogInRemoteDatasourceImpl({required this.client});

  @override
  Future<LogInResponseModel> tryLogIn(
      {required LogInParams loginParams}) async {
    final PetitionResponse res = await client.post(
      API.apiLogIn,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: LogInParamsModel(
              email: loginParams.email, password: loginParams.password)
          .toJson(),
    );

    print(res.data);
    if (res.statusCode == 200) {
      try {
        final loginResponse = LogInResponseModel.fromJson(res.data);
        return loginResponse;
      } catch (e) {
        throw ModelException(message: "Can't create LogIn Model");
      }
    }
    throw ServerException(errorCode: res.statusCode);
  }
}
