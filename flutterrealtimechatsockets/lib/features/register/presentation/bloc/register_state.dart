part of 'register_bloc.dart';

sealed class RegisterState {}

final class RegisterInitialState extends RegisterState {}
final class RegisterLoadingState extends RegisterState {}
final class RegisterErrorState extends RegisterState {}
final class RegisterSuccesfulState extends RegisterState {}
