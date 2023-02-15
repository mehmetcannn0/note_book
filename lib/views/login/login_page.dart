import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_book/data/src/colors.dart';
import 'package:note_book/data/src/images.dart';
import 'package:note_book/data/src/strings.dart';
import 'package:note_book/views/home/home_page.dart';
import 'package:note_book/views/login/login_controller.dart';
import 'package:note_book/views/register/register_page.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({super.key});

  static const String routeName = '/views/login/login_page';

  @override
  Widget build(BuildContext context) {
    // print("login page build içerisi kac defa tekrar edecek");

    controller.error.listen((error) => _errorDialog());
    // controller.error.listen((error) => _errorDialog(error));
    controller.isLogin.listen((isLogin) {
      print("is login dinleniyor");
      if (isLogin) {
        print("is login true");
        controller.isLogin.call(false);
        _goToHome();
      }
    });
    controller.errorTexts.listen((errorTexts) {
      if (errorTexts != null) {
        _errorTextDialog(errorTexts);
      }
    });

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: true,
          title: const Text(loginAppBarText),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // butonu buyutmek ıcın yaptık
          children: [
            _buildSpace(),
            _buildImage(),
            _buildMaxSpace(),
            _buildUsernameTextField(),
            _buildSpace(),
            _buildPasswordTextField(),
            _buildMaxSpace(),
            _buildButton(),
            _buildSpace(),
            _buildRegisterText(),
            _buildSpace(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Image.asset(
      githubLogo,
      height: Get.height * .3,
    );
  }

  Widget _buildUsernameTextField() {
    return Material(
      elevation: 10,
      color: white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(300),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 40, 2),
        child: TextField(
          textInputAction:
              TextInputAction.next, //klavyedekı bıttı tusu yerıne ılerı geldı
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: usernameText,
          ),
          //  controller: controller.usernameController,
          controller: controller.usernameController,
          //! controller.usernameController
          //?????
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Material(
      elevation: 10,
      color: white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(300),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 10, 2),
        child: TextField(
          textInputAction: TextInputAction.done,
          obscureText: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: passwordText,
          ),
          // controller: LoginController().passwordController,
          controller: controller.passwordController,
          //! controller.passwordController
          //?????
        ),
      ),
    );
  }

  Widget _buildButton() {
    const double size = 40;
    return SizedBox(
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: mainColor),
        onPressed: () {
          if (controller.usernameController.text.isNotEmpty &&
              controller.passwordController.text.isNotEmpty) {
            controller.callingLoginService(
              controller.usernameController.text,
              controller.passwordController.text,
            );
          } else {
            _emptyDialog();
          }

          print("login butonuna basıldı");
        },
        child: const Text(loginButton),
      ),
    );
  }

  Widget _buildSpace() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget _buildMaxSpace() {
    return const SizedBox(
      height: 40,
    );
  }

  Widget _buildRegisterText() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          const TextSpan(
            text: registerQuestionText,
            style: TextStyle(color: black),
          ),
          TextSpan(
              text: registerButtonText,
              style: const TextStyle(
                color: black,
                fontStyle: FontStyle.italic,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.offNamed(RegisterPage.routeName);
                }),
        ]));
  }

  void _goToHome() {
    // print("go to login calıstı");
    // Get.toNamed(HomePage.routName);//boyle yapınca ekranın ustune yenı ekran eklıyor
    Get.offAndToNamed(HomePage
        .routeName); //boyle yapınca eskı ekranı kapatıp yerıne yenı ekran acıyor
  }

  void _errorDialog() {
    // print("error dialog calıstı \n error dialog un ıcı");
    // print("login page ->error dıalogundakı error : $error");
    Get.snackbar(
      errorTitle,
      errorDescription,
      colorText: white,
      backgroundColor: red,
    );
    // print("error dialog kapandı");
  }

  void _emptyDialog() {
    Get.snackbar(
      errorTitle,
      emptyText,
      colorText: white,
      backgroundColor: red,
    );
  }

  void _errorTextDialog(String descriptiion) {
    Get.snackbar(
      errorTitle,
      descriptiion,
      colorText: white,
      backgroundColor: red,
    );
  }
}
