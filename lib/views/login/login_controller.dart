import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:note_book/data/services/login/login_service.dart';
import 'package:note_book/data/services/login/model/login_request_model.dart';
import 'package:note_book/data/services/login/model/login_response_model.dart';
import 'package:note_book/data/src/strings.dart';
import 'package:note_book/views/common/common_values.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();
  final RxBool isLogin = RxBool(false);
  final RxnString errorTexts = RxnString();

  final Rxn<LoginResponseModel> user = Rxn();

  final LoginService _loginService;

  LoginController(this._loginService);
  void callingLoginService(String username, String password) {
    final LoginRequestModel requestModel =
        LoginRequestModel(username: username, password: password);
    isLoading.call(true);
    _loginService.login(requestModel).then((user) {
      // print("user.statu :");
      // print(user.statu);
      if (user.statu == 2) isLogin.call(true);
      if (user.statu == 1) errorTexts.value = wrongPasswordText;
      if (user.statu == 0) errorTexts.value = noUserText;
      userId.value = user.userId;
      print("user.userId: ");
      print(user.userId);
    }).catchError((dynamic error) {
      this.error.trigger(error);
    }).whenComplete(() {
      // if (error.toString() != "null") {
      //   print("when içi \nerror mesajı :  $error");
      // }
      isLoading.call(false);
    });
  }
}
