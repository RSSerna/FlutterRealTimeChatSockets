import 'package:equatable/equatable.dart';

class HomeInternalToken extends Equatable {
  final String token;

  const HomeInternalToken({
    required this.token,
  });

  @override
  List<Object> get props => [token];
}
