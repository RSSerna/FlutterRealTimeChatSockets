import 'package:fpdart/fpdart.dart';

import 'package:flutterrealtimechatsockets/core/errors/failures.dart';
import 'package:flutterrealtimechatsockets/features/register/domain/entities/register_params.dart';
import 'package:flutterrealtimechatsockets/features/register/domain/entities/register_response.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterResponse>> tryRegister(RegisterParams registerParams);
}
