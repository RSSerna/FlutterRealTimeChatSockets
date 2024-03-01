import 'package:flutterrealtimechatsockets/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract class UseCase<Type, Params> {
  Either<Failure, Type> call(Params params);
}

abstract class FutureUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
