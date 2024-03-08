import 'package:flutterrealtimechatsockets/core/constants/constants.dart';
import 'package:flutterrealtimechatsockets/core/secure_storage/secure_storage.dart';
import 'package:flutterrealtimechatsockets/features/loading/data/models/internal_token_model.dart';

abstract class LoadingLocalDatasource {
  Future<InternalTokenModel> tryGetToken();
  Future<void> tryDeleteToken();
  Future<void> trySaveToken(InternalTokenModel internalTokenModel);
}

class LoadingLocalDatasourceImpl extends LoadingLocalDatasource {
  final SecureStorage secureStorage;

  LoadingLocalDatasourceImpl({required this.secureStorage});

  @override
  Future<InternalTokenModel> tryGetToken() async {
    String token = await secureStorage.read(key: Constants.securedToken);
    return InternalTokenModel(token: token);
  }
  
  @override
  Future<void> tryDeleteToken() async {
    return await secureStorage.delete(key: Constants.securedToken);
  }
  
  @override
  Future<void> trySaveToken(InternalTokenModel internalTokenModel) async {
    return await secureStorage.write(key: Constants.securedToken, value: internalTokenModel.token);
  }
}
