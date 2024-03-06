class MyExceptions implements Exception {
  final String? message;

  MyExceptions({required this.message});
}

class SocketException extends MyExceptions {
  SocketException({required super.message});
}

class MyHttpException extends MyExceptions {
  MyHttpException({required super.message});
}

class ServerException extends MyExceptions {
  final int errorCode;
  ServerException({super.message, this.errorCode = 500});
}

class ModelException extends MyExceptions {
  ModelException({required super.message});
}

class SecureStorageException extends MyExceptions {
  SecureStorageException({super.message});
}
