import 'package:flutterrealtimechatsockets/core/errors/failures.dart';

abstract class MyExceptions implements Exception {
  final String? message;
  const MyExceptions({required this.message});
  Failure getFailureFromException();
}

class SocketException extends MyExceptions {
  const SocketException({super.message});

  @override
  Failure getFailureFromException() {
    return const SocketFailure();
  }
}

class MyHttpException extends MyExceptions {
  const MyHttpException({required super.message});

  @override
  Failure getFailureFromException() {
    return MyHttpFailure(msg: super.message);
  }
}

class ServerException extends MyExceptions {
  final int errorCode;
  const ServerException({super.message, this.errorCode = 500});

  @override
  Failure getFailureFromException() {
    return ServerFailure(errorCode: errorCode, msg: super.message);
  }
}

class ModelException extends MyExceptions {
  const ModelException({required super.message});

  @override
  Failure getFailureFromException() {
    return const ModelFailure();
  }
}

class SecureStorageException extends MyExceptions {
  const SecureStorageException({super.message});

  @override
  Failure getFailureFromException() {
    return const SecureStorageFailure();
  }
}
