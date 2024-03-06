import 'package:dio/dio.dart';
import 'package:http/http.dart';

class PetitionResponse {
  final int statusCode;
  final String data;
  final bool isRedirect;
  final Map<String, String> headers;

  PetitionResponse({
    required this.statusCode,
    required this.data,
    required this.isRedirect,
    required this.headers,
  });
}
class ResponseHttp {
  // String body = '';
  // int statusCode = 1;
  BaseRequest? request;
  Map<String, String> headers = const {};
  // bool isRedirect = false;
  bool persistentConnection = true;
  String? reasonPhrase;
}

/*
  Http.Body = Dio.data
  Http.statusCode = Dio.statusCode
  Http.isRedirect = Dio.isRedirect
  
*/

class ResponseDio<T> {
  // T? data;
  RequestOptions? requestOptions;
  // int? statusCode;
  String? statusMessage;
  // bool isRedirect = false;
  List<RedirectRecord> redirects = const [];
  Map<String, dynamic>? extra;
  Headers? headers;
}