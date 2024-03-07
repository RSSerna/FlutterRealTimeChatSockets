import 'package:flutterrealtimechatsockets/core/http/custom_http_client.dart';
import 'package:flutterrealtimechatsockets/core/secure_storage/secure_storage.dart';

abstract class HomeRemoteDatasource {}

class HomeRemoteDatasourceImpl extends HomeRemoteDatasource {
  final CustomHttpClient client;
  final SecureStorage secureStorage;
  HomeRemoteDatasourceImpl({required this.client, required this.secureStorage});
}
