import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final List<dynamic> properties;

  const Failure({this.properties = const []});

  @override
  List<Object?> get props => properties;
}

class SocketFailure extends Failure {}

class MyHttpFailure extends Failure {
  final String msg;

  MyHttpFailure({required this.msg}) : super(properties: [msg]);
}

class ServerFailure extends Failure {
  final int errorCode;
  final String msg;

  ServerFailure({required this.errorCode, required this.msg})
      : super(properties: [errorCode, msg]);
}

class UndocumentedFailure extends Failure {
  const UndocumentedFailure();
}
