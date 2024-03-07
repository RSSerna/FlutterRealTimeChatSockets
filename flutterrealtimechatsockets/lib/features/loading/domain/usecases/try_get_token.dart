import 'package:flutterrealtimechatsockets/features/loading/domain/entities/internal_token.dart';
import 'package:flutterrealtimechatsockets/features/loading/domain/repositories/loading_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutterrealtimechatsockets/core/errors/failures.dart';
import 'package:flutterrealtimechatsockets/core/usecase/usecase.dart';

class TryGetToken extends FutureUseCase<InternalToken, NoParams> {
  final LoadingRepository loadingRepository;

  TryGetToken({
    required this.loadingRepository,
  });

  @override
  Future<Either<Failure, InternalToken>> call(NoParams params) async {
    return await loadingRepository.tryGetToken();
  }
}
