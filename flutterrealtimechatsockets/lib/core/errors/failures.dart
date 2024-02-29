import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final List<dynamic> properties;

  const Failure({this.properties = const []});

  @override
  List<Object?> get props => properties;
}

class SocketFailure extends Failure {}

class HttpFailure extends Failure {
  final String code;
  final String msg;

  HttpFailure({required this.code, required this.msg})
      : super(properties: [code, msg]);
}
