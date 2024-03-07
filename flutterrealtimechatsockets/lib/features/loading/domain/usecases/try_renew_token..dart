import 'package:flutterrealtimechatsockets/features/loading/domain/entities/internal_token.dart';
import 'package:flutterrealtimechatsockets/features/loading/domain/entities/token_response.dart';
import 'package:flutterrealtimechatsockets/features/loading/domain/repositories/loading_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutterrealtimechatsockets/core/errors/failures.dart';
import 'package:flutterrealtimechatsockets/core/usecase/usecase.dart';

class TryRenewToken extends FutureUseCase<TokenResponse, InternalToken> {
  final LoadingRepository loadingRepository;

  TryRenewToken({
    required this.loadingRepository,
  });

  @override
  Future<Either<Failure, TokenResponse>> call(InternalToken params) async {
    return await loadingRepository.tryRenewToken(params);
  }
}
