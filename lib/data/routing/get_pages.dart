import 'package:get/get.dart';
import 'package:note_book/views/add_notes/add_notes_page.dart';
import 'package:note_book/views/home/home_page.dart';
import 'package:note_book/views/info/info_page.dart';
import 'package:note_book/views/login/login_page.dart';
import 'package:note_book/views/profile/profile_page.dart';
import 'package:note_book/views/register/register_page.dart';
import 'package:note_book/views/search/search_page.dart';

List<GetPage> getPages = [
  GetPage(
    name: LoginPage.routeName,
    page: () => const LoginPage(),
  ),
  GetPage(
    name: HomePage.routeName,
    page: () => const HomePage(),
  ),
  GetPage(
    name: RegisterPage.routeName,
    page: () => const RegisterPage(),
  ),
  GetPage(
    name: AddNotesPage.routeName,
    page: () => const AddNotesPage(),
  ),
  GetPage(
    name: InfoPage.routeName,
    page: () => const InfoPage(),
  ),
  GetPage(
    name: ProfilePage.routeName,
    page: () => const ProfilePage(),
  ),
  GetPage(
    name: SearchPage.routeName,
    page: () => const SearchPage(),
  ),
];
