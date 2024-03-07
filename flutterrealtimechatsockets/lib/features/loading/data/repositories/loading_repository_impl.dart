import 'package:flutterrealtimechatsockets/features/loading/data/datasources/loading_remote_datasource.dart';
import 'package:flutterrealtimechatsockets/features/loading/domain/entities/token_response.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutterrealtimechatsockets/core/errors/error_handler.dart';
import 'package:flutterrealtimechatsockets/core/errors/failures.dart';
import 'package:flutterrealtimechatsockets/features/loading/data/datasources/loading_local_datasource.dart';
import 'package:flutterrealtimechatsockets/features/loading/domain/entities/internal_token.dart';
import 'package:flutterrealtimechatsockets/features/loading/domain/repositories/loading_repository.dart';

class LoadingRepositoryImpl extends LoadingRepository {
  final LoadingLocalDatasource loadingLocalDatasource;
  final LoadingRemoteDatasource loadingRemoteDatasource;

  LoadingRepositoryImpl(
      {required this.loadingLocalDatasource,
      required this.loadingRemoteDatasource});

  @override
  Future<Either<Failure, InternalToken>> tryGetToken() async {
    return await errorHandlerOrResponse(loadingLocalDatasource.tryGetToken());
  }

  @override
  Future<Either<Failure, TokenResponse>> tryRenewToken(
      InternalToken token) async {
    return await errorHandlerOrResponse(
        loadingRemoteDatasource.tryRenewToken(internalToken: token));
  }
}
