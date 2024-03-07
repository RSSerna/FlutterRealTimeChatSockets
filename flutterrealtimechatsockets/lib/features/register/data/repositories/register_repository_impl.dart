import 'package:fpdart/fpdart.dart';

import 'package:flutterrealtimechatsockets/core/errors/error_handler.dart';
import 'package:flutterrealtimechatsockets/core/errors/failures.dart';
import 'package:flutterrealtimechatsockets/features/register/data/datasources/register_remote_datasource.dart';
import 'package:flutterrealtimechatsockets/features/register/domain/entities/register_params.dart';
import 'package:flutterrealtimechatsockets/features/register/domain/entities/register_response.dart';
import 'package:flutterrealtimechatsockets/features/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterRemoteDatasource registerRemoteDatasource;

  RegisterRepositoryImpl({required this.registerRemoteDatasource});

  @override
  Future<Either<Failure, RegisterResponse>> tryRegister(
      RegisterParams registerParams) async {
    return await errorHandlerOrResponse(
        registerRemoteDatasource.tryRegister(registerParams: registerParams));
  }
}
