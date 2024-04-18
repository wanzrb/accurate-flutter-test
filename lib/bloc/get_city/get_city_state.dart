part of 'get_city_bloc.dart';

sealed class GetCityState {}

final class GetCityInitial extends GetCityState {}

final class GetCityStateLoading extends GetCityState {}

final class GetCityStateLoaded extends GetCityState {
  final List<City> city;

  GetCityStateLoaded(this.city);
}

final class GetCityStateError extends GetCityState {
  final String error;

  GetCityStateError(this.error);
}
