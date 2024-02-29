import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final List<dynamic> properties;

  const Failure({this.properties = const []});

  @override
  List<Object?> get props => properties;
}

class SocketFailure extends Failure {}

class UndocumentedFailure extends Failure {
  const UndocumentedFailure();
}

class HttpFailure extends Failure {
  final int errorCode;
  final String msg;

  HttpFailure({required this.errorCode, required this.msg})
      : super(properties: [errorCode, msg]);
}
