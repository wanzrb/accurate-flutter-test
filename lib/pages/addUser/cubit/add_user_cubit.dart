import 'package:flutter_bloc/flutter_bloc.dart';

class AddUserCubit extends Cubit<String> {
  AddUserCubit() : super('Tangerang');

  void selectedCity(String city) => emit(city);
}
