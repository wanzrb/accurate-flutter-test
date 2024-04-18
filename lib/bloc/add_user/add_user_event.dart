part of 'add_user_bloc.dart';

sealed class AddUserEvent {}

class AddUserEventPost extends AddUserEvent {
  final String name;
  final String address;
  final String email;
  final String phoneNumber;
  final String city;

  AddUserEventPost(
      {required this.name,
      required this.address,
      required this.email,
      required this.phoneNumber,
      required this.city});
}
