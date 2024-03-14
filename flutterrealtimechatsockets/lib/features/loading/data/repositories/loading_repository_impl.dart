import 'package:fpdart/fpdart.dart';
import 'package:flutterrealtimechatsockets/core/errors/error_handler.dart';
import 'package:flutterrealtimechatsockets/core/errors/failures.dart';
import 'package:flutterrealtimechatsockets/features/loading/data/datasources/loading_local_datasource.dart';
import 'package:flutterrealtimechatsockets/features/loading/data/datasources/loading_remote_datasource.dart';
import 'package:flutterrealtimechatsockets/features/loading/domain/repositories/loading_repository.dart';

class LoadingRepositoryImpl extends LoadingRepository {
  final LoadingLocalDatasource loadingLocalDatasource;
  final LoadingRemoteDatasource loadingRemoteDatasource;

  LoadingRepositoryImpl(
      {required this.loadingLocalDatasource,
      required this.loadingRemoteDatasource});

  @override
  Future<Either<Failure, void>> tryRenewToken() async {
    try {
      var token = await loadingLocalDatasource.tryGetToken();
      await loadingRemoteDatasource.tryRenewToken(internalToken: token);
      return const Right(null);
    } catch (e) {
      try {
        await loadingLocalDatasource.tryDeleteToken();
      } catch (e) {
        return Left(errorHandler(e));
      }
      return Left(errorHandler(e));
    }
  }
}
