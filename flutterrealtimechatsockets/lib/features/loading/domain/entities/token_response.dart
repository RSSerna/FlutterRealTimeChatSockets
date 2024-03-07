import 'package:equatable/equatable.dart';
import 'package:flutterrealtimechatsockets/core/user/domain/entities/user.dart';

class TokenResponse extends Equatable {
  final bool ok;
  final User userDB;
  final String token;

  const TokenResponse({
    required this.ok,
    required this.userDB,
    required this.token,
  });

  @override
  List<Object> get props => [ok, userDB, token];
}
