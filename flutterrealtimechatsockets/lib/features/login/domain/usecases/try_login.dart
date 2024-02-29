import 'package:fpdart/fpdart.dart';

import 'package:flutterrealtimechatsockets/core/errors/failures.dart';
import 'package:flutterrealtimechatsockets/core/usecase/usecase.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/entities/login_params.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/entities/login_response.dart';
import 'package:flutterrealtimechatsockets/features/login/domain/repositories/login_repository.dart';

class TryLogIn extends FutureUseCase<LogInResponse, LogInParams> {
  final LogInRepository logInRepository;

  TryLogIn({
    required this.logInRepository,
  });

  @override
  Future<Either<Failure, LogInResponse>> call(LogInParams params) async {
    return await logInRepository.tryLogIn(params);
  }
}
