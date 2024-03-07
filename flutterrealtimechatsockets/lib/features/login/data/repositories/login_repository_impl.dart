import 'package:fpdart/fpdart.dart';
import 'package:flutterrealtimechatsockets/core/errors/error_handler.dart';
import 'package:flutterrealtimechatsockets/core/errors/failures.dart';
import 'package:flutterrealtimechatsockets/features/login/data/datasources/login_remote_datasource.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/entities/login_params.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/entities/login_response.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/repositories/login_repository.dart';

class LogInRepositoryImpl extends LogInRepository {
  final LogInRemoteDatasource logInRemoteDatasource;

  LogInRepositoryImpl({
    required this.logInRemoteDatasource,
  });

  @override
  Future<Either<Failure, LogInResponse>> tryLogIn(
      LogInParams loginParams) async {
    return await errorHandlerOrResponse(
        logInRemoteDatasource.tryLogIn(loginParams: loginParams));
  }
}
