import 'package:equatable/equatable.dart';

class InternalToken extends Equatable {
  final String token;

  const InternalToken({
    required this.token,
  });

  @override
  List<Object> get props => [token];
}
