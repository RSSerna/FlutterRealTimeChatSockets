import 'package:flutterrealtimechatsockets/core/http/custom_http_client.dart';
import 'package:flutterrealtimechatsockets/core/http/http_client_mix.dart';
import 'package:flutterrealtimechatsockets/features/login/data/datasources/login_remote_datasource.dart';
import 'package:flutterrealtimechatsockets/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/repositories/login_repository.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/usecases/try_login.dart';
import 'package:flutterrealtimechatsockets/features/login/presentation/provider/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

abstract class InjectionContainer {
  Future<void> init();
}

class InjectionContainerImpl implements InjectionContainer {
  final sl = GetIt.instance;

  @override
  Future<void> init() async {
    ///Auth Service
    //Provider
    sl.registerFactory(() => AuthService(tryLogIn: sl()));

    //Usecases
    sl.registerLazySingleton(() => TryLogIn(logInRepository: sl()));

    //Repository
    sl.registerLazySingleton<LogInRepository>(
      () => LogInRepositoryImpl(logInRemoteDatasource: sl()),
    );

    //Data
    sl.registerLazySingleton<LogInRemoteDatasource>(
      () => LogInRemoteDatasourceImpl(client: sl()),
    );

    sl.registerLazySingleton(Client.new);
    sl.registerLazySingleton(() => HttpClientMix(client: sl()));
    sl.registerLazySingleton<CustomHttpClient>(
      () => CustomHttpClientImpl(clientMix: sl()),
    );
  }
}
