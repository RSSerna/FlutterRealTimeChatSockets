import 'package:flutterrealtimechatsockets/core/functionalSocket/functional_socket.dart';
import 'package:flutterrealtimechatsockets/core/functionalSocket/functional_socket_io_client_impl.dart';
import 'package:flutterrealtimechatsockets/features/home/data/datasources/home_local_datasource.dart';
import 'package:flutterrealtimechatsockets/features/home/data/datasources/home_remote_datasource.dart';
import 'package:flutterrealtimechatsockets/features/home/data/repositories/home_repository_impl.dart';
import 'package:flutterrealtimechatsockets/features/home/domain/repositories/home_repository.dart';
import 'package:flutterrealtimechatsockets/features/home/domain/usecases/get_users.dart';
import 'package:flutterrealtimechatsockets/features/home/domain/usecases/try_logout.dart';
import 'package:flutterrealtimechatsockets/features/home/presentation/provider/home_service.dart';
import 'package:http/http.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutterrealtimechatsockets/core/http/custom_http_client.dart';
import 'package:flutterrealtimechatsockets/core/http/http_client_mix.dart';
import 'package:flutterrealtimechatsockets/core/secure_storage/secure_storage.dart';
import 'package:flutterrealtimechatsockets/features/loading/data/datasources/loading_local_datasource.dart';
import 'package:flutterrealtimechatsockets/features/loading/data/datasources/loading_remote_datasource.dart';
import 'package:flutterrealtimechatsockets/features/loading/data/repositories/loading_repository_impl.dart';
import 'package:flutterrealtimechatsockets/features/loading/domain/repositories/loading_repository.dart';
import 'package:flutterrealtimechatsockets/features/loading/domain/usecases/try_renew_token.dart';
import 'package:flutterrealtimechatsockets/features/loading/presentation/provider/loading_service.dart';
import 'package:flutterrealtimechatsockets/features/login/data/datasources/login_remote_datasource.dart';
import 'package:flutterrealtimechatsockets/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/repositories/login_repository.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/usecases/try_login.dart';
import 'package:flutterrealtimechatsockets/features/login/presentation/provider/login_service.dart';
import 'package:flutterrealtimechatsockets/features/register/data/datasources/register_remote_datasource.dart';
import 'package:flutterrealtimechatsockets/features/register/data/repositories/register_repository_impl.dart';
import 'package:flutterrealtimechatsockets/features/register/domain/repositories/register_repository.dart';
import 'package:flutterrealtimechatsockets/features/register/domain/usecases/try_register.dart';
import 'package:flutterrealtimechatsockets/features/register/presentation/provider/register_service.dart';

abstract class InjectionContainer {
  Future<void> init();
}

class InjectionContainerImpl implements InjectionContainer {
  final sl = GetIt.instance;

  @override
  Future<void> init() async {
    //----------------------------------------- Core ---------------------------------------------
    //Http
    sl.registerLazySingleton(Client.new);
    sl.registerLazySingleton(() => HttpClientMix(client: sl()));
    sl.registerLazySingleton<CustomHttpClient>(
      () => CustomHttpClientImpl(clientMix: sl()),
    );

    //Secure Storage
    sl.registerLazySingleton(() => const FlutterSecureStorage());
    sl.registerLazySingleton<SecureStorage>(() => SecureStorageImpl(sl()));

    //Functional Socket
    sl.registerSingleton<FunctionalSocket>(
        FunctionalSocketIOClientImpl(secureStorage: sl()));

    ///Login Service
    //Provider
    sl.registerFactory(
        () => LoginService(tryLogIn: sl(), functionalSocket: sl()));

    //Usecases
    sl.registerLazySingleton(() => TryLogIn(logInRepository: sl()));

    //Repository
    sl.registerLazySingleton<LogInRepository>(
      () => LogInRepositoryImpl(logInRemoteDatasource: sl()),
    );

    //Data
    sl.registerLazySingleton<LogInRemoteDatasource>(
      () => LogInRemoteDatasourceImpl(client: sl(), secureStorage: sl()),
    );

    //--------------------------------------------------------------------------------------
    ///Home Service
    //Provider
    sl.registerFactory(
        () => HomeService(tryLogOut: sl(), functionalSocket: sl()));

    //Usecases
    sl.registerLazySingleton(() => TryLogOut(homeRepository: sl()));
    sl.registerLazySingleton(() => GetUsers(homeRepository: sl()));

    //Repository
    sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
          homeLocalDatasource: sl(), homeRemoteDatasource: sl()),
    );

    //Data
    sl.registerLazySingleton<HomeLocalDatasource>(
      () => HomeLocalDatasourceImpl(secureStorage: sl()),
    );
    sl.registerLazySingleton<HomeRemoteDatasource>(
      () => HomeRemoteDatasourceImpl(client: sl()),
    );

    //--------------------------------------------------------------------------------------

    ///Register Service
    //Provider
    sl.registerFactory(() => RegisterService(tryRegister: sl()));

    //Usecases
    sl.registerLazySingleton(() => TryRegister(registerRepository: sl()));

    //Repository
    sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(registerRemoteDatasource: sl()),
    );

    //Data
    sl.registerLazySingleton<RegisterRemoteDatasource>(
      () => RegisterRemoteDatasourceImpl(client: sl()),
    );

    //--------------------------------------------------------------------------------------

    ///Loading Service
    //Provider
    sl.registerFactory(
        () => LoadingService(tryRenewToken: sl(), functionalSocket: sl()));

    //Usecases
    sl.registerLazySingleton(() => TryRenewToken(loadingRepository: sl()));

    //Repository
    sl.registerLazySingleton<LoadingRepository>(
      () => LoadingRepositoryImpl(
          loadingLocalDatasource: sl(), loadingRemoteDatasource: sl()),
    );

    //Data
    sl.registerLazySingleton<LoadingRemoteDatasource>(
      () => LoadingRemoteDatasourceImpl(client: sl(), secureStorage: sl()),
    );
    sl.registerLazySingleton<LoadingLocalDatasource>(
      () => LoadingLocalDatasourceImpl(secureStorage: sl()),
    );
  }
}
