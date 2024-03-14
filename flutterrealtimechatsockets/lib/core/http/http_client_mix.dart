import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';

import 'package:flutterrealtimechatsockets/core/errors/exceptions.dart';

class HttpClientMix implements Client {
  Client client;

  HttpClientMix({
    required this.client,
  });

  @override
  Future<Response> delete(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    try {
      return await client.delete(url,
          headers: headers, body: body, encoding: encoding);
    } catch (e) {
      throw MyHttpException(message: e.toString());
    }
  }

  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) async {
    try {
      return await client.get(url, headers: headers);
    } catch (e) {
      throw MyHttpException(message: e.toString());
    }
  }

  @override
  Future<Response> post(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    try {
      return await client.post(url, headers: headers, body: body, encoding: encoding);
    } catch (e) {
      throw MyHttpException(message: e.toString());
    }
  }

  @override
  Future<Response> put(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    try {
      return await client.put(url, headers: headers, body: body, encoding: encoding);
    } catch (e) {
      throw MyHttpException(message: e.toString());
    }
  }

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) async {
    try {
      return await client.head(url, headers: headers);
    } catch (e) {
      throw MyHttpException(message: e.toString());
    }
  }

  @override
  Future<Response> patch(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    try {
      return await client.patch(url,
          headers: headers, body: body, encoding: encoding);
    } catch (e) {
      throw MyHttpException(message: e.toString());
    }
  }

  @override
  Future<String> read(Uri url, {Map<String, String>? headers}) async {
    try {
      return await client.read(url, headers: headers);
    } catch (e) {
      throw MyHttpException(message: e.toString());
    }
  }

  @override
  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) async {
    try {
      return await client.readBytes(url, headers: headers);
    } catch (e) {
      throw MyHttpException(message: e.toString());
    }
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) => client.send(request);

  @override
  void close() => client.close();
}
