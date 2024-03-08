import 'package:fpdart/fpdart.dart';
import 'package:flutterrealtimechatsockets/core/errors/failures.dart';

abstract class LoadingRepository {
  Future<Either<Failure, void>> tryRenewToken();
}
