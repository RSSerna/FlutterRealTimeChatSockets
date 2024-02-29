import 'package:fpdart/fpdart.dart';
import 'package:flutterrealtimechatsockets/core/l10n/generated/l10n.dart';
import 'package:flutterrealtimechatsockets/core/errors/exceptions.dart';
import 'package:flutterrealtimechatsockets/core/errors/failures.dart';

/// This function takes a [function] that returns a Future and
/// handles exceptions that might occur during its execution.
/// It returns an [Either] type indicating a successful result ([Right])
/// or an error ([Left]).
Future<Either<Failure, T>> errorHandlerOrResponse<T>(Future<T> function) async {
  try {
    return Right(await function);
  } on ServerException catch (e) {
    return Left(ServerFailure(
      msg: _serverErrorMessage(e.errorCode),
      errorCode: e.errorCode,
    ));
  } on SocketException {
    return Left(SocketFailure());
  } on MyHttpException catch (e){
    return Left(MyHttpFailure(msg: e.message!));
  } catch (e) {
    return const Left(UndocumentedFailure());
  }
}

String _serverErrorMessage(int errorCode) {
  // return 'error';
  switch (errorCode) {
    case 400:
      return L10n.current.error400;

    case 401:
      return L10n.current.error401;

    case 403:
      return L10n.current.error403;

    case 404:
      return L10n.current.error404;

    case 405:
      return L10n.current.error405;

    case 429:
      return L10n.current.error429;

    //Server Error Responses 5xx
    case 500:
      return L10n.current.error500;

    case 502:
      return L10n.current.error502;

    case 503:
      return L10n.current.error503;

    case 504:
      return L10n.current.error504;

    default:
      return L10n.current.errorDefault;
  }
}