import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_book/data/src/colors.dart';
import 'package:note_book/data/src/strings.dart';
import 'package:note_book/views/add_notes/add_notes_controller.dart';
import 'package:note_book/views/home/home_page.dart';

class AddNotesPage extends GetWidget<AddNotesController> {
  const AddNotesPage({super.key});

  static const String routeName = '/views/add_notes/add_notes_page';
  @override
  Widget build(BuildContext context) {
    controller.isSave.listen((isSave) {
      isSave ? _goToHome() : _empty();
    });
    controller.error.listen((error) => _errorDialog());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: mainColor,
          centerTitle: true,
          title: const Text(addNoteAppBarText),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSpace(),
                _buildTitleText(),
                _buildSpace(),
                _buildTextFieldTitle(),
                _buildSpace(),
                const Divider(),
                _buildSpace(),
                _buildDescriptionText(),
                _buildSpace(),
                _buildTextFieldDescription(),
                _buildSpace(),
                const Divider(),
                _buildSpace(),
              ],
            ),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleText() {
    return const Text(
      addNoteTitleText,
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

  Widget _buildDescriptionText() {
    return const Text(
      addNoteDescText,
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

  Widget _buildTextFieldTitle() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: addNoteTitleHintText,
          ),
          controller: controller.titleController,
        ),
      ),
    );
  }

  Widget _buildTextFieldDescription() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: addNoteDescHintText,
          ),
          controller: controller.descriptionController,
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
        onPressed: () => _onTap(),
        child: const Text(addNoteSaveButtonText),
      ),
    );
  }

  Widget _buildSpace() {
    return const SizedBox(
      height: 20,
    );
  }

  void _onTap() {
    if (controller.titleController.text.isNotEmpty ||
        controller.descriptionController.text.isNotEmpty) {
      controller.callingAddNotesService(
        controller.titleController.text,
        controller.descriptionController.text,
      );
    } else {
      _emptyDialog();
    }
  }

  void _emptyDialog() {
    Get.snackbar(
      errorTitle,
      emptyText,
      colorText: white,
      backgroundColor: red,
    );
  }

  void _errorDialog() {
    Get.snackbar(
      errorTitle,
      errorDescription,
      colorText: white,
      backgroundColor: red,
    );
  }

  void _goToHome() {
    print('home');
    Get.toNamed(HomePage.routeName);
  }

  void _empty() {}
}
