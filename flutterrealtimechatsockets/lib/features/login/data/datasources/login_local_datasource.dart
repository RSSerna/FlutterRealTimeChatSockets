import 'package:flutterrealtimechatsockets/core/constants/constants.dart';
import 'package:flutterrealtimechatsockets/core/secure_storage/secure_storage.dart';
import 'package:flutterrealtimechatsockets/features/login/data/models/login_response_model.dart';

abstract class LogInLocalDatasource {
  Future<void> saveToken({required LogInResponseModel logInResponseModel});
}

class LogInLocalDatasourceImpl extends LogInLocalDatasource {
  final SecureStorage secureStorage;
  LogInLocalDatasourceImpl(
      { required this.secureStorage});

  @override
  Future<void> saveToken(
      {required LogInResponseModel logInResponseModel}) async {
    await secureStorage.write(
        key: Constants.securedToken, value: logInResponseModel.token);
  }
}
