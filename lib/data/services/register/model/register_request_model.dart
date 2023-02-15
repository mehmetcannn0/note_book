// To parse this JSON data, do
//
//     final registerRequestModel = registerRequestModelFromJson(jsonString);

import 'dart:convert';

// RegisterRequestModel registerRequestModelFromJson(String str) => RegisterRequestModel.fromJson(json.decode(str));

String registerRequestModelToJson(RegisterRequestModel data) =>
    json.encode(data.toJson());

class RegisterRequestModel {
  final String username;
  final String password;
  final String email;
  final String book;

  RegisterRequestModel({
    required this.username,
    required this.password,
    required this.email,
    required this.book,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "book": book,
      };
  //!!!!!!! onemli
  //register.php dekı post yaptıgımız sekılde yazdık
}
