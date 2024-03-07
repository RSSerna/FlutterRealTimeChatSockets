import 'package:fpdart/fpdart.dart';
import 'package:flutterrealtimechatsockets/core/errors/error_handler.dart';
import 'package:flutterrealtimechatsockets/core/errors/failures.dart';
import 'package:flutterrealtimechatsockets/features/home/data/datasources/home_local_datasource.dart';
import 'package:flutterrealtimechatsockets/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeLocalDatasource homeLocalDatasource;

  HomeRepositoryImpl({
    required this.homeLocalDatasource,
  });

  @override
  Future<Either<Failure, void>> tryLogOut() async {
    return await errorHandlerOrResponse(homeLocalDatasource.tryLogOut());
  }
}
