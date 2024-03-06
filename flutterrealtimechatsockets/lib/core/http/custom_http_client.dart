import 'dart:convert';
import 'package:flutterrealtimechatsockets/core/errors/exceptions.dart';
import 'package:http/http.dart';

import 'package:flutterrealtimechatsockets/core/http/http_client_mix.dart';
import 'package:flutterrealtimechatsockets/core/http/local_uri_resolver.dart';
import 'package:flutterrealtimechatsockets/core/http/petition_response.dart';

abstract class CustomHttpClient {
  Future<PetitionResponse> delete(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  });

  Future<PetitionResponse> get(
    String path, {
    Map<String, String>? headers,
  });

  Future<PetitionResponse> post(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  });

  Future<PetitionResponse> put(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  });
}

class CustomHttpClientImpl extends CustomHttpClient {
  HttpClientMix clientMix;
  CustomHttpClientImpl({
    required this.clientMix,
  });

  @override
  Future<PetitionResponse> delete(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final res = await clientMix.delete(
        LocalUriResolver.resolveLocalHttpUri(path),
        body: body,
        encoding: encoding);
    return toPetitionResponse(res);
  }

  @override
  Future<PetitionResponse> get(
    String path, {
    Map<String, String>? headers,
  }) async {
    final res = await clientMix.get(LocalUriResolver.resolveLocalHttpUri(path),
        headers: headers);
    return toPetitionResponse(res);
  }

  @override
  Future<PetitionResponse> post(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    print('Path: $path');
    final res = await clientMix.post(LocalUriResolver.resolveLocalHttpUri(path),
        headers: headers, body: body, encoding: encoding);
    return toPetitionResponse(res);
  }

  @override
  Future<PetitionResponse> put(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final res = await clientMix.put(LocalUriResolver.resolveLocalHttpUri(path),
        headers: headers, body: body, encoding: encoding);
    return toPetitionResponse(res);
  }

  PetitionResponse toPetitionResponse(Response res) {
    try {
      print('ToPetitionResponse');
      PetitionResponse petitionResponse = PetitionResponse(
          statusCode: res.statusCode,
          data: res.body,
          isRedirect: res.isRedirect,
          headers: res.headers);
      return petitionResponse;
    } catch (e) {
      throw ModelException(message: 'ToPetitionResponse');
    }
  }
}
