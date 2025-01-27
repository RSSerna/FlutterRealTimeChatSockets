import 'package:fpdart/fpdart.dart';
import 'package:flutterrealtimechatsockets/core/errors/failures.dart';
import 'package:flutterrealtimechatsockets/core/usecase/usecase.dart';
import 'package:flutterrealtimechatsockets/features/home/domain/repositories/home_repository.dart';

class GetUsers extends FutureUseCase<void, NoParams> {
  final HomeRepository homeRepository;

  GetUsers({
    required this.homeRepository,
  });

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await homeRepository.getUsers();
  }
}
