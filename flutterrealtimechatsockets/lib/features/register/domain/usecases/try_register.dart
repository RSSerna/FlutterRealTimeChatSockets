import 'package:fpdart/fpdart.dart';
import 'package:flutterrealtimechatsockets/core/errors/failures.dart';
import 'package:flutterrealtimechatsockets/core/usecase/usecase.dart';
import 'package:flutterrealtimechatsockets/features/register/domain/entities/register_params.dart';
import 'package:flutterrealtimechatsockets/features/register/domain/entities/register_response.dart';
import 'package:flutterrealtimechatsockets/features/register/domain/repositories/register_repository.dart';

class TryRegister extends FutureUseCase<RegisterResponse, RegisterParams> {
  final RegisterRepository registerRepository;

  TryRegister({
    required this.registerRepository,
  });

  @override
  Future<Either<Failure, RegisterResponse>> call(RegisterParams params) async {
    return await registerRepository.tryRegister(params);
  }
}
