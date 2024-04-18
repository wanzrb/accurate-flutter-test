import 'package:accurate_test/models/city.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

part 'get_city_event.dart';
part 'get_city_state.dart';

class GetCityBloc extends Bloc<GetCityEvent, GetCityState> {
  GetCityBloc() : super(GetCityInitial()) {
    on<GetCityEventLoad>((event, emit) async {
      try {
        emit(GetCityStateLoading());
        var response = await Dio().get(
          "https://627e360ab75a25d3f3b37d5a.mockapi.io/api/v1/accurate/city",
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
        );

        List<City> cityList = (response.data as List<dynamic>)
            .map((e) => City.fromJson(e))
            .toList();

        emit(GetCityStateLoaded(cityList));
      } catch (e) {
        emit(GetCityStateError(e.toString()));
      }
    });
  }
}
