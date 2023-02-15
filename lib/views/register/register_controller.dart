import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_book/data/services/register/model/register_request_model.dart';
import 'package:note_book/data/services/register/model/register_response_model.dart';
import 'package:note_book/data/services/register/register_service.dart';

class RegisterController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordVerifyController =
      TextEditingController();
  final TextEditingController bookController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();
  final RxBool isRegister = RxBool(false);

  final Rxn<RegisterResponseModel> user = Rxn();

  final RegisterService _registerService;

  RegisterController(this._registerService);

  Future<void> callingRegisterService(
      String username, String password, String email, String book) async {
    final RegisterRequestModel _userRequest = RegisterRequestModel(
      username: username,
      password: password,
      email: email,
      book: book,
    );

    isLoading.call(true);
    _registerService.register(_userRequest).then((user) {
      // print("controller sayfası user: " + user);
      isRegister.call(true);
    }).catchError((dynamic error) {
      this.error.trigger(error);
    }).whenComplete(() {
      // print("when içi email:**______-----" + _userRequest.email);
      // print("when complete calıstı");
      if (error.toString() != "null") {
        print("when içi \nerror mesajı :  $error");
      }
      // print("_userRequest : deneme kısmı " + _userRequest.toString());
      isLoading.call(false);
    });
  }
}
