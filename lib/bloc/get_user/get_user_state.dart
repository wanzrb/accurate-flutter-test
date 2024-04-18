part of 'get_user_bloc.dart';

sealed class GetUserState {}

final class GetUserInitial extends GetUserState {}

final class GetUserStateLoading extends GetUserState {}

final class GetUserStateLoaded extends GetUserState {
  final List<User> users;

  GetUserStateLoaded(this.users);
}

final class GetUserStateError extends GetUserState {
  final String error;

  GetUserStateError(this.error);
}
