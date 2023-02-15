import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_book/data/src/colors.dart';
import 'package:note_book/data/src/strings.dart';
import 'package:note_book/views/info/info_controller.dart';

class InfoPage extends GetWidget<InfoController> {
  const InfoPage({super.key});
  static const String routeName = '/views/info/info_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: true,
          title: const Text(infoAppBarText)),
      body: Center(
        child: Text("Hakkında sayfası"),
      ),
    );
  }
}
