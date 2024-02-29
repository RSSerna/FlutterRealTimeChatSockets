import 'package:flutterrealtimechatsockets/core/constants/environments.dart';

class LocalUriResolver {
  static Uri resolveLocalHttpUri(String path) {
    return Uri.http(Environments.apiUrl, path);
  }

  static Uri resolveLocalHttpsUri(String path) {
    return Uri.https(Environments.apiUrl, path);
  }
}
