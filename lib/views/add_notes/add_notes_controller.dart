import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:note_book/data/services/add_notes/add_notes_service.dart';
import 'package:note_book/data/services/add_notes/model/add_notes_request_model.dart';
import 'package:note_book/data/services/add_notes/model/add_notes_response_model.dart';
import 'package:note_book/views/common/common_values.dart';

class AddNotesController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();
  final RxBool isSave = RxBool(false);

  final Rxn<AddNotesResponseModel> note = Rxn();

  final AddNotesService _addNotesService;

  AddNotesController(this._addNotesService);

  void callingAddNotesService(String title, String description) {
    final AddNotesRequestModel addNotesRequestModel = AddNotesRequestModel(
      title: title,
      description: description,
      isRemove: '0',
      userId: userId.value,
    );

    isLoading.call(true);
    _addNotesService.addNotes(addNotesRequestModel).then(
      (note) {
        print("note.statu:  ");
        print(note.statu.toString());
        if (note.statu) isSave.call(true);
      },
    ).catchError((dynamic error) {
      this.error.trigger(error);
    }).whenComplete(
      () {
        isLoading.call(false);
      },
    );
  }
}
