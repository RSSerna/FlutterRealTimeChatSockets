import 'package:flutterrealtimechatsockets/core/errors/error_handler.dart';
import 'package:flutterrealtimechatsockets/core/errors/failures.dart';
import 'package:flutterrealtimechatsockets/features/home/data/datasources/home_local_datasource.dart';
import 'package:flutterrealtimechatsockets/features/home/data/datasources/home_remote_datasource.dart';
import 'package:flutterrealtimechatsockets/features/home/domain/entities/user_response.dart';
import 'package:flutterrealtimechatsockets/features/home/domain/repositories/home_repository.dart';
import 'package:fpdart/fpdart.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeLocalDatasource homeLocalDatasource;
  final HomeRemoteDatasource homeRemoteDatasource;

  HomeRepositoryImpl({
    required this.homeLocalDatasource,
    required this.homeRemoteDatasource,
  });

  @override
  Future<Either<Failure, void>> tryLogOut() async {
    return await errorHandlerOrResponse(homeLocalDatasource.tryLogOut());
  }

  @override
  Future<Either<Failure, List<UserResponse>>> getUsers() async {
    try {
      var token = await homeLocalDatasource.tryGetToken();
      var users = await homeRemoteDatasource.getUsers(chatInternalToken: token);
      return Right(users);
    } catch (e) {
      return Left(errorHandler(e));
    }
  }
}
