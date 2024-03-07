import 'package:fpdart/fpdart.dart';

import 'package:flutterrealtimechatsockets/core/errors/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, void>> tryLogOut();
}
