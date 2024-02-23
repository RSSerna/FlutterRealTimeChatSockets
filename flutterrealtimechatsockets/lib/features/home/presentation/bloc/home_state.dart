part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitialState extends HomeState {}
final class HomeTryRefreshState extends HomeState {}
final class HomeRefresCompletedhState extends HomeState {}
final class HomeRefreshErrorState extends HomeState {}
