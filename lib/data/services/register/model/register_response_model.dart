// To parse this JSON data, do
//
//     final registerResponseModel = registerResponseModelFromJson(jsonString);

//https://app.quicktype.io/ sıtesınden aldık

//   {
//     "STATU":true,
// "MESSAGE":"Kullanici eklendi."

// }

import 'dart:convert';

RegisterResponseModel registerResponseModelFromJson(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  final bool statu;
  final String message;

  RegisterResponseModel.fromJson(Map<String, dynamic> json)
      : statu = json["STATU"],
        message = json["MESSAGE"];
}
