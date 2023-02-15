import 'package:http/http.dart' as http;
import 'package:note_book/data/services/add_notes/model/add_notes_request_model.dart';
import 'package:note_book/data/services/add_notes/model/add_notes_response_model.dart';

abstract class AddNotesService {
  Future addNotes(AddNotesRequestModel addNotesRequestModel);
}

class AddNotesServiceImp extends AddNotesService {
  @override
  Future addNotes(AddNotesRequestModel addNotesRequestModel) async {
    const String _baseUrl = 'http://10.0.2.2:80/notebook/add_notes.php';

    // const String _baseUrl = 'http://mce.epizy.com/notebook/add_notes.php';

    var _url = Uri.parse(_baseUrl);
    try {
      final response =
          await http.post(_url, body: addNotesRequestModel.toJson());

      if (response.statusCode == 200) {
        print('not ekleme başarılı');

        print("json bastırma ");
        print("response.body");
        print(response.body);

        print(addNotesRequestModel.toJson());

        print("json bastırıldı");
        // print("returnden once :");
        return addNotesResponseModelFromJson(response.body);
      } else {
        return '';
      }
    } catch (e) {
      print(
          "*********************** \ntry catch içerisindeki e: $e \n bu son mu  \n*****************");
    }
  }
}
