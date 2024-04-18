import 'package:accurate_test/models/city.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

part 'add_user_event.dart';
part 'add_user_state.dart';

class AddUserBloc extends Bloc<AddUserEvent, AddUserState> {
  List<City> cityList = [];

  AddUserBloc() : super(AddUserInitial()) {
    on<AddUserEventGetCity>((event, emit) async {
      try {
        emit(AddUserStateGetCityLoading());
        var response = await Dio().get(
          "https://627e360ab75a25d3f3b37d5a.mockapi.io/api/v1/accurate/city",
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
        );

        cityList = (response.data as List<dynamic>)
            .map((e) => City.fromJson(e))
            .toList();

        emit(AddUserStateGetCitySuccess(cityList));
      } catch (e) {
        emit(AddUserStateGetCityError(e.toString()));
      }
    });
    on<AddUserEventPost>((event, emit) async {
      try {
        emit(AddUserStatePostLoading());
        var response = await Dio().post(
          "https://627e360ab75a25d3f3b37d5a.mockapi.io/api/v1/accurate/user",
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
          data: {
            "name": event.name,
            "address": event.address,
            "email": event.email,
            "phoneNumber": event.phoneNumber,
            "city": event.city
          },
        );

        emit(AddUserStatePostSuccess());
      } catch (e) {
        emit(AddUserStatePostError(e.toString()));
      }
    });
  }
}
