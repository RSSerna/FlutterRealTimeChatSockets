import 'package:fpdart/fpdart.dart';
import 'package:flutterrealtimechatsockets/core/errors/failures.dart';
import 'package:flutterrealtimechatsockets/core/usecase/usecase.dart';
import 'package:flutterrealtimechatsockets/features/loading/domain/repositories/loading_repository.dart';

class TryRenewToken extends FutureUseCase<void, NoParams> {
  final LoadingRepository loadingRepository;

  TryRenewToken({
    required this.loadingRepository,
  });

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await loadingRepository.tryRenewToken();
  }
}
