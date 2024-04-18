import 'package:accurate_test/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  bool isReversed = false;
  List<User> userList = [];
  HomeBloc() : super(HomeInitial()) {
    on<HomeEventGetUser>((event, emit) async {
      emit(HomeStateGetLoading());
      var response = await Dio().get(
        "https://627e360ab75a25d3f3b37d5a.mockapi.io/api/v1/accurate/user",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      userList = (response.data as List<dynamic>)
          .map((e) => User.fromJson(e))
          .toList();

      emit(HomeStateGetSuccess(userList));
      try {} catch (e) {
        emit(HomeStateGetError(e.toString()));
      }
    });
  }
}
