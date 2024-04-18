import 'package:bloc/bloc.dart';

class ReversedCubit extends Cubit<bool> {
  ReversedCubit() : super(false);

  void isReversed() => emit(!state);
}

class AddUserCubit extends Cubit<String> {
  AddUserCubit() : super('Tangerang');

  void selectedCity(String city) => emit(city);
}