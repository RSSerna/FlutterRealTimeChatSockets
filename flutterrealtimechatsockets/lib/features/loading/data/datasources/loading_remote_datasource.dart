import 'dart:convert';
import 'dart:io';

import 'package:flutterrealtimechatsockets/core/constants/api.dart';
import 'package:flutterrealtimechatsockets/core/constants/constants.dart';
import 'package:flutterrealtimechatsockets/core/errors/exceptions.dart';
import 'package:flutterrealtimechatsockets/core/http/custom_http_client.dart';
import 'package:flutterrealtimechatsockets/core/http/petition_response.dart';
import 'package:flutterrealtimechatsockets/core/secure_storage/secure_storage.dart';
import 'package:flutterrealtimechatsockets/features/loading/data/models/token_response_model.dart';
import 'package:flutterrealtimechatsockets/features/loading/domain/entities/internal_token.dart';

abstract class LoadingRemoteDatasource {
  Future<TokenResponseModel> tryRenewToken(
      {required InternalToken internalToken});
}

class LoadingRemoteDatasourceImpl extends LoadingRemoteDatasource {
  final CustomHttpClient client;
  final SecureStorage secureStorage;

  LoadingRemoteDatasourceImpl(
      {required this.client, required this.secureStorage});

  @override
  Future<TokenResponseModel> tryRenewToken(
      {required InternalToken internalToken}) async {
        print("tryRenewToken");
    final PetitionResponse response = await client.get(
      API.apiRenew,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        'x-token': internalToken.token
      },
    );
    print(response.data);

    Map<String, dynamic> jsonData = json.decode(response.data);

    if (response.statusCode == 200) {
      try {
        final tokenResponse = TokenResponseModel.fromJson(response.data);
        secureStorage.write(
            key: Constants.securedToken, value: jsonData['token']);
        return tokenResponse;
      } catch (e) {
        throw const ModelException(message: "Can't create Register Model");
      }
    }
    throw ServerException(errorCode: response.statusCode);
  }
}
