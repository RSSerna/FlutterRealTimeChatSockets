import 'package:equatable/equatable.dart';
import 'package:flutterrealtimechatsockets/core/user/domain/entities/user.dart';

class RegisterResponse extends Equatable {
  final bool ok;
  final User userDb;
  final String token;

  const RegisterResponse({
    required this.ok,
    required this.userDb,
    required this.token,
  });

  @override
  List<Object> get props => [ok, userDb, token];
}
