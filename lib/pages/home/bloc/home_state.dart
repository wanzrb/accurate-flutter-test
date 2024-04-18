part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeStateGetLoading extends HomeState {}

final class HomeStateGetSuccess extends HomeState {
  final List<User> users;

  HomeStateGetSuccess(this.users);
}

final class HomeStateGetError extends HomeState {
  final String error;

  HomeStateGetError(this.error);
}
