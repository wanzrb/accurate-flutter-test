part of 'add_user_bloc.dart';

sealed class AddUserState {}

final class AddUserInitial extends AddUserState {}

final class AddUserStateLoading extends AddUserState {}

final class AddUserStatePosted extends AddUserState {}

final class AddUserStateError extends AddUserState {
  final String error;

  AddUserStateError(this.error);
}
