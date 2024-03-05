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
