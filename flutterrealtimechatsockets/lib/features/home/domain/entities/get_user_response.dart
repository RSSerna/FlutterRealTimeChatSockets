import 'package:equatable/equatable.dart';
import 'package:flutterrealtimechatsockets/features/home/domain/entities/user_response.dart';

class GetUsersResponse extends Equatable {
  final bool ok;
  final List<UserResponse> users;
  final int from;

  const GetUsersResponse({
    required this.ok,
    required this.users,
    required this.from,
  });

  @override
  List<Object> get props => [ok, users, from];
}
