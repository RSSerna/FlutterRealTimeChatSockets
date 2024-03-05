import 'dart:io';

import 'package:flutterrealtimechatsockets/core/constants/api.dart';
import 'package:flutterrealtimechatsockets/core/errors/exceptions.dart';
import 'package:flutterrealtimechatsockets/core/http/custom_http_client.dart';
import 'package:flutterrealtimechatsockets/core/http/petition_response.dart';
import 'package:flutterrealtimechatsockets/features/register/data/models/register_params_model.dart';
import 'package:flutterrealtimechatsockets/features/register/data/models/register_response_model.dart';
import 'package:flutterrealtimechatsockets/features/register/domain/entities/register_params.dart';

abstract class RegisterRemoteDatasource {
  Future<RegisterResponseModel> tryRegister(
      {required RegisterParams registerParams});
}

class RegisterRemoteDatasourceImpl extends RegisterRemoteDatasource {
  final CustomHttpClient client;

  RegisterRemoteDatasourceImpl({required this.client});

  @override
  Future<RegisterResponseModel> tryRegister(
      {required RegisterParams registerParams}) async {
    final PetitionResponse res = await client.post(
      API.apiLogIn,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: RegisterParamsModel(
              email: registerParams.email,
              password: registerParams.password,
              name: registerParams.name)
          .toJson(),
    );

    print(res.data);
    if (res.statusCode == 200) {
      try {
        final registerResponse = RegisterResponseModel.fromJson(res.data);
        return registerResponse;
      } catch (e) {
        throw ModelException(message: "Can't create Register Model");
      }
    }
    throw ServerException(errorCode: res.statusCode);
  }
}
