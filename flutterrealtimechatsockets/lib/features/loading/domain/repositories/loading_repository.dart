import 'package:flutterrealtimechatsockets/features/loading/domain/entities/token_response.dart';
import 'package:fpdart/fpdart.dart';

import 'package:flutterrealtimechatsockets/core/errors/failures.dart';
import 'package:flutterrealtimechatsockets/features/loading/domain/entities/internal_token.dart';

abstract class LoadingRepository {
  Future<Either<Failure, InternalToken>> tryGetToken();
  Future<Either<Failure, TokenResponse>> tryRenewToken(InternalToken token);
}
