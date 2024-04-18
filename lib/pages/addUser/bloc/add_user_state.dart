part of 'add_user_bloc.dart';

sealed class AddUserState {}

final class AddUserInitial extends AddUserState {}

final class AddUserStateGetCityLoading extends AddUserState {}

final class AddUserStateGetCitySuccess extends AddUserState {
  final List<City> city;

  AddUserStateGetCitySuccess(this.city);
}

final class AddUserStateGetCityError extends AddUserState {
  final String error;

  AddUserStateGetCityError(this.error);
}

final class AddUserStatePostLoading extends AddUserState {}

final class AddUserStatePostSuccess extends AddUserState {}

final class AddUserStatePostError extends AddUserState {
  final String error;

  AddUserStatePostError(this.error);
}
