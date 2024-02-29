class MyExceptions implements Exception {
  final String? message;

  MyExceptions({required this.message});
}

class SocketException extends MyExceptions {
  SocketException({required super.message});
}

class MyHttpException extends MyExceptions {
  final int errorCode;

  MyHttpException({required super.message, this.errorCode = 500});
}

class ModelException extends MyExceptions {
  ModelException({required super.message});
}
