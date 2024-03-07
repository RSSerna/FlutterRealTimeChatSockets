import 'package:flutterrealtimechatsockets/core/constants/constants.dart';
import 'package:flutterrealtimechatsockets/core/secure_storage/secure_storage.dart';

abstract class HomeLocalDatasource {
  Future<void> tryLogOut();
}

class HomeLocalDatasourceImpl extends HomeLocalDatasource {
  final SecureStorage secureStorage;
  HomeLocalDatasourceImpl({required this.secureStorage});

  @override
  Future<void> tryLogOut() async {
    await secureStorage.delete(key: Constants.securedToken);
  }
}
