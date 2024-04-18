import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

part 'add_user_event.dart';
part 'add_user_state.dart';

class AddUserBloc extends Bloc<AddUserEvent, AddUserState> {
  AddUserBloc() : super(AddUserInitial()) {
    on<AddUserEventPost>((event, emit) async {
      try {
        emit(AddUserStateLoading());
        await Dio().post(
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

        emit(AddUserStatePosted());
      } catch (e) {
        emit(AddUserStateError(e.toString()));
      }
    });
  }
}
