import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_book/data/src/colors.dart';
import 'package:note_book/data/src/images.dart';
import 'package:note_book/data/src/strings.dart';
import 'package:note_book/views/add_notes/add_notes_page.dart';
import 'package:note_book/views/common/common_values.dart';
import 'package:note_book/views/home/home_controller.dart';
import 'package:note_book/views/info/info_page.dart';
import 'package:note_book/views/login/login_page.dart';
import 'package:note_book/views/profile/profile_page.dart';
import 'package:note_book/views/search/search_page.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  static const String routeName = '/views/home/home_page';

  @override
  Widget build(BuildContext context) {
    controller.error.listen((error) => _errorDialog());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: const Text(homeAppBarText),
      ),
      drawer: _buildDrawer(),
      body: _buildBody(),
      floatingActionButton: _buildFloatActionButton(),
    );
  }

  Widget _buildFloatActionButton() {
    return FloatingActionButton(
      backgroundColor: mainColor,
      onPressed: _goToAddNotePage,
      child: Icon(Icons.add),
    );
  }

  Widget _buildBody() {
    return Obx(
      () => ListView.builder(
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: _buildCard(
            controller.notesTitle.value?[index] ?? "",
            controller.notesDescription.value?[index] ?? "",
            controller.notesDate.value?[index].toString() ?? "",
          ),
        ),
        itemCount: controller.notesTitle.value?.length ?? 0,
      ),
    );
  }

  Widget _buildCard(
    String title,
    String description,
    String date,
  ) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: _buildCardColumn(title, description, date)),
    );
  }

  Widget _buildCardColumn(
    String title,
    String description,
    String date,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "deneme title, desc, date \n $title \n$description \n$date \n$userId",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Divider(),
        _buildSpace(),
        Text(
          description,
        ),
        _buildSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              date,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildSpace() {
    return SizedBox(
      height: 10,
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      // backgroundColor: mainColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(),
          _buildTitle(homeAppBarText, Icons.home, _goToBack),
          const Divider(),
          _buildTitle(profileText, Icons.person, _goToProfile),
          const Divider(),
          _buildTitle(infoText, Icons.info, _goToInfo),
          const Divider(),
          _buildTitle(searchAppBarText, Icons.search, _goToSearchPage),
          Divider(),
          _buildTitle(logoutText, Icons.logout, _goToLogout),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return const UserAccountsDrawerHeader(
      currentAccountPicture: CircleAvatar(
        backgroundColor: mainColor,
        backgroundImage: AssetImage(githubLogo_2),
      ),
      accountName: Text("user name eklenecek"),
      accountEmail: Text("user emaıl eklenecek"),
      decoration: BoxDecoration(color: mainColor),
    );
  }

  Widget _buildTitle(String text, IconData, Function function) {
    return ListTile(
      title: Text(text),
      leading: Icon(
        IconData,
        color: mainColor,
      ),
      // trailing: Icon(Icons.arrow_forward),
      onTap: () => function(),
    );
  }

  void _goToBack() {
    Get.back();
  }

  void _goToProfile() {
    Get.toNamed(ProfilePage.routeName);
  }

  void _goToInfo() {
    Get.toNamed(InfoPage.routeName);
  }

  void _goToLogout() {
    Get.offNamedUntil(LoginPage.routeName, (route) => false);
  }

  void _goToAddNotePage() {
    Get.toNamed(AddNotesPage.routeName);
  }

  void _goToSearchPage() {
    Get.toNamed(SearchPage.routeName);
  }

  void _errorDialog() {
    Get.snackbar(
      errorTitle,
      errorDescription,
      colorText: white,
      backgroundColor: red,
    );
  }
}
