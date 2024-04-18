import 'package:bloc/bloc.dart';

class ReversedCubit extends Cubit<bool> {
  ReversedCubit() : super(false);

  void isReversed() => emit(!state);
}

class AddUserCubit extends Cubit<String> {
  AddUserCubit() : super('Tangerang');

  void selectedCity(String city) => emit(city);
}

class FilterCityCubit extends Cubit<String> {
  FilterCityCubit() : super('Semua');

  void filterSelected(String city) => emit(city);
}

class SearchCubit extends Cubit<String> {
  SearchCubit() : super('');

  void searchUser(String value) => emit(value);
}
