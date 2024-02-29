import 'dart:convert';

import 'package:flutterrealtimechatsockets/core/http/local_uri_resolver.dart';
import 'package:http/http.dart';

import 'package:flutterrealtimechatsockets/core/http/http_client_mix.dart';

abstract class CustomHttpClient {
  Future<Response> delete(String path,
      {Map<String, String>? headers, Object? body, Encoding? encoding});

  Future<Response> get(String path, {Map<String, String>? headers});

  Future<Response> post(String path,
      {Map<String, String>? headers, Object? body, Encoding? encoding});

  Future<Response> put(String path,
      {Map<String, String>? headers, Object? body, Encoding? encoding});
}

class CustomHttpClientImpl extends CustomHttpClient {
  HttpClientMix clientMix;
  CustomHttpClientImpl({
    required this.clientMix,
  });

  @override
  Future<Response> delete(String path,
          {Map<String, String>? headers,
          Object? body,
          Encoding? encoding}) async =>
      await clientMix.delete(LocalUriResolver.resolveLocalHttpUri(path),
          body: body, encoding: encoding);

  @override
  Future<Response> get(String path, {Map<String, String>? headers}) async =>
      await clientMix.get(LocalUriResolver.resolveLocalHttpUri(path),
          headers: headers);

  @override
  Future<Response> post(String path,
          {Map<String, String>? headers,
          Object? body,
          Encoding? encoding}) async =>
      await clientMix.post(LocalUriResolver.resolveLocalHttpUri(path),
          headers: headers, body: body, encoding: encoding);

  @override
  Future<Response> put(String path,
          {Map<String, String>? headers,
          Object? body,
          Encoding? encoding}) async =>
      await clientMix.put(LocalUriResolver.resolveLocalHttpUri(path),
          headers: headers, body: body, encoding: encoding);
}
