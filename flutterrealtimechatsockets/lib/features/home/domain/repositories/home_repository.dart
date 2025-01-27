import 'package:flutterrealtimechatsockets/features/home/domain/entities/user_response.dart';
import 'package:fpdart/fpdart.dart';

import 'package:flutterrealtimechatsockets/core/errors/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, void>> tryLogOut();
  Future<Either<Failure, List<UserResponse>>> getUsers();
}
