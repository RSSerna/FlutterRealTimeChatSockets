import 'package:equatable/equatable.dart';
import 'package:flutterrealtimechatsockets/core/errors/error_handler.dart';

class Failure extends Equatable {
  final List<dynamic> properties;

  const Failure({this.properties = const []});

  @override
  List<Object?> get props => properties;
}

class SocketFailure extends Failure {
  const SocketFailure();
}

class MyHttpFailure extends Failure {
  final String? msg;

  MyHttpFailure({required this.msg}) : super(properties: [msg]);
}

class ServerFailure extends Failure {
  final int errorCode;
  final String? msg;
  final String msgCode;

  ServerFailure({required this.errorCode, required this.msg})
      : msgCode = serverErrorMessage(errorCode),
        super(properties: [errorCode, msg]);
}

class UndocumentedFailure extends Failure {
  const UndocumentedFailure();
}

class SecureStorageFailure extends Failure {
  const SecureStorageFailure();
}

class ModelFailure extends Failure {
  const ModelFailure();
}
