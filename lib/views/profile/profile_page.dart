import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_book/data/src/colors.dart';
import 'package:note_book/data/src/strings.dart';
import 'package:note_book/views/profile/profile_controller.dart';

class ProfilePage extends GetWidget<ProfileController> {
  const ProfilePage({super.key});
  static const String routeName = '/views/profile/profile_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: true,
          title: Text(profileAppBarText)),
      body: Center(
        child: Text("Profil sayfası"),
      ),
    );
  }
}
