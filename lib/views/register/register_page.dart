import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_book/data/src/colors.dart';
import 'package:note_book/data/src/strings.dart';
import 'package:note_book/views/login/login_page.dart';
import 'package:note_book/views/register/register_controller.dart';

class RegisterPage extends GetWidget<RegisterController> {
  const RegisterPage({super.key});

  static const String routeName = '/views/register/register_page';

  @override
  Widget build(BuildContext context) {
    controller.isRegister.listen((isRegister) {
      // print("register page is register: $isRegister");
      if (isRegister) _goToLogin();
    });
    // controller.error.listen((error) => _errorDialog(error));
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(registerAppBarText),
          backgroundColor: mainColor,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSpace(),
          _buildUsernameTextField(),
          _buildSpace(),
          _buildEmailTextField(),
          _buildSpace(),
          _buildBookTextField(),
          _buildSpace(),
          _buildPasswordTextField(),
          _buildSpace(),
          _buildPasswordVerifyTextField(),
          _buildSpace(),
          _bulidButton(),
          _buildSpace(),
        ],
      ),
    );
  }

  Widget _buildUsernameTextField() {
    return Material(
      elevation: 10,
      color: white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(300),
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
          //!
          //?????
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return Material(
      elevation: 10,
      color: white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 40, 2),
        child: TextField(
          textInputAction:
              TextInputAction.next, //klavyedekı bıttı tusu yerıne ılerı geldı
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: emailText,
          ),
          //  controller: controller.usernameController,
          controller: controller.emailController,
          //!
          //?????
        ),
      ),
    );
  }

  Widget _buildBookTextField() {
    return Material(
      elevation: 10,
      color: white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 40, 2),
        child: TextField(
          textInputAction:
              TextInputAction.next, //klavyedekı bıttı tusu yerıne ılerı geldı
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: bookText,
          ),
          //  controller: controller.usernameController,
          controller: controller.bookController,
          //!
          //?????
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Material(
      elevation: 10,
      color: white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 10, 2),
        child: TextField(
          obscureText: true,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: passwordText,
          ),
          controller: controller.passwordController,
          //!
          //?????
        ),
      ),
    );
  }

  Widget _buildPasswordVerifyTextField() {
    return Material(
      elevation: 10,
      color: white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(300),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 10, 2),
        child: TextField(
          obscureText: true,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: passwordVerifyText,
          ),
          controller: controller.passwordVerifyController,
          //!
          //?????
        ),
      ),
    );
  }

  Widget _bulidButton() {
    const double size = 40;
    return SizedBox(
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: mainColor),
        onPressed: () => _onTap(),
        child: const Text(registerText),
      ),
    );
  }

  void _onTap() {
    // print("ontap içerisi kac defa tekrar edecek");
    controller.callingRegisterService(
      // usernameText,
      // passwordText
      // ,emailText,bookText
      controller.usernameController.text,
      controller.passwordController.text,
      controller.emailController.text,
      controller.bookController.text,
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

  void _goToLogin() {
    // print("go to login calıstı");
    Get.toNamed(LoginPage.routeName);
  }

  void _errorDialog(var error) {
    // print("error dialog calıstı \n error dialog un ıcı");
    print("register page ->error dıalogundakı error : $error");
    Get.snackbar(
      errorTitle,
      errorDescription,
      colorText: white,
      backgroundColor: red,
    );
    print("error dialog kapandı");
  }
}
