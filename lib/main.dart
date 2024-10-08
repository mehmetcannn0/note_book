import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:note_book/data/get_controller.dart';
import 'package:note_book/data/routing/get_pages.dart';
import 'package:note_book/views/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future main() async {
    await getControllers();
  }

  @override
  Widget build(BuildContext context) {
    main();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      home: const LoginPage(),
    );
  }
}
