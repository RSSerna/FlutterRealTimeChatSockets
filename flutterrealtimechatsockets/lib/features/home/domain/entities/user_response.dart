import 'package:equatable/equatable.dart';

class UserResponse extends Equatable {
  final String name;
  final String email;
  final bool online;
  final String uid;

  const UserResponse({
    required this.name,
    required this.email,
    required this.online,
    required this.uid,
  });

  @override
  List<Object> get props => [name, email, online, uid];
}
