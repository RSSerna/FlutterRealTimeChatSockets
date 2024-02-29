import 'package:fpdart/fpdart.dart';

import 'package:flutterrealtimechatsockets/core/errors/failures.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/entities/login_params.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/entities/login_response.dart';

abstract class LogInRepository {
  Future<Either<Failure, LogInResponse>> tryLogIn(LogInParams loginParams);
}
