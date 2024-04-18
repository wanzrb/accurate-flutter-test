import 'package:accurate_test/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  GetUserBloc() : super(GetUserInitial()) {
    on<GetUserEventLoad>((event, emit) async {
      try {
        emit(GetUserStateLoading());
        var response = await Dio().get(
          "https://627e360ab75a25d3f3b37d5a.mockapi.io/api/v1/accurate/user",
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
        );
        List<User> userList = (response.data as List<dynamic>)
            .map((e) => User.fromJson(e))
            .toList();

        emit(GetUserStateLoaded(userList));
      } catch (e) {
        emit(GetUserStateError(e.toString()));
      }
    });
  }
}
