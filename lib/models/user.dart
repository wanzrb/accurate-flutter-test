// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? name;
  String? address;
  String? email;
  String? phoneNumber;
  String? city;
  String? id;

  User({
    this.name,
    this.address,
    this.email,
    this.phoneNumber,
    this.city,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        address: json["address"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        city: json["city"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "email": email,
        "phoneNumber": phoneNumber,
        "city": city,
        "id": id,
      };
}
