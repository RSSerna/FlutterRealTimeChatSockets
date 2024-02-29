import 'dart:convert';
import 'dart:io';
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
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    try {
      return client.delete(url,
          headers: headers, body: body, encoding: encoding);
    } on HttpException catch (e) {
      throw MyHttpException(message: e.message);
    }
  }

  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) {
    try {
      return client.get(url, headers: headers);
    } on HttpException catch (e) {
      throw MyHttpException(message: e.message);
    }
  }

  @override
  Future<Response> post(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    try {
      return client.post(url, headers: headers, body: body, encoding: encoding);
    } on HttpException catch (e) {
      throw MyHttpException(message: e.message);
    }
  }

  @override
  Future<Response> put(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    try {
      return client.put(url, headers: headers, body: body, encoding: encoding);
    } on HttpException catch (e) {
      throw MyHttpException(message: e.message);
    }
  }

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) {
    try {
      return client.head(url, headers: headers);
    } on HttpException catch (e) {
      throw MyHttpException(message: e.message);
    }
  }

  @override
  Future<Response> patch(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    try {
      return client.patch(url,
          headers: headers, body: body, encoding: encoding);
    } on HttpException catch (e) {
      throw MyHttpException(message: e.message);
    }
  }

  @override
  Future<String> read(Uri url, {Map<String, String>? headers}) {
    try {
      return client.read(url, headers: headers);
    } on HttpException catch (e) {
      throw MyHttpException(message: e.message);
    }
  }

  @override
  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) {
    try {
      return client.readBytes(url, headers: headers);
    } on HttpException catch (e) {
      throw MyHttpException(message: e.message);
    }
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) => client.send(request);

  @override
  void close() => client.close();
}
