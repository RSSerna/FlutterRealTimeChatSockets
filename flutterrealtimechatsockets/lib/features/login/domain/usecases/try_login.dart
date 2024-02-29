import 'package:fpdart/src/either.dart';

import 'package:flutterrealtimechatsockets/core/errors/failures.dart';
import 'package:flutterrealtimechatsockets/core/usecase/usecase.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/entities/login_params.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/entities/login_response.dart';

class TryLogin extends FutureUseCase<LoginResponse, LoginParams> {
  @override
  Future<Either<Failure, LoginResponse>?> call(LoginParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
