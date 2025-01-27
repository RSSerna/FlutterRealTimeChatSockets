import 'package:flutterrealtimechatsockets/core/constants/constants.dart';
import 'package:flutterrealtimechatsockets/core/secure_storage/secure_storage.dart';
import 'package:flutterrealtimechatsockets/features/home/data/models/home_internal_token_model.dart';

abstract class HomeLocalDatasource {
  Future<void> tryLogOut();
  Future<HomeInternalTokenModel> tryGetToken();
}

class HomeLocalDatasourceImpl extends HomeLocalDatasource {
  final SecureStorage secureStorage;
  HomeLocalDatasourceImpl({required this.secureStorage});

  @override
  Future<void> tryLogOut() async {
    await secureStorage.delete(key: Constants.securedToken);
  }

  @override
  Future<HomeInternalTokenModel> tryGetToken() async {
    String token = await secureStorage.read(key: Constants.securedToken);
    return HomeInternalTokenModel(token: token);
  }
}
