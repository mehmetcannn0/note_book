import 'package:http/http.dart' as http;
import 'package:note_book/data/services/home/model/home_response_model.dart';
import 'package:note_book/views/common/common_values.dart';

abstract class HomeService {
  Future getNotesTitle();
  Future getNotesDescription();
  Future getNotesDate();
  Future getUserNotesTitle();
  Future getUserNotesDescription();
  Future getUserNotesDate();
}

class HomeServiceImp extends HomeService {
  @override
  Future getNotesTitle() async {
    const String _baseUrl = 'http://10.0.2.2:80/notebook/get_notes.php';

    // const String _baseUrl = 'http://mce.epizy.com/notebook/get_notes.php';

    var _url = Uri.parse(_baseUrl);
    try {
      final response = await http.get(_url);

      // print(response);
      // // print("response body");
      // print(response.body);

      // // print("response isRedirect");
      // print(response.isRedirect); //false
      // // print("response persistentConnection");
      // print(response.persistentConnection); //trueS
      // // print("response reasonPhrase");
      // print(response.reasonPhrase); //ok
      // // print("response request ");
      // print(response.request);

      var noteListTitle = [];

      if (response.statusCode == 200) {
        var data = homeResponseModelFromJson(response.body);
        for (int i = 0; i < data.length; i++) {
          noteListTitle.add(data[i].title);
        }
        return noteListTitle;
      } else {
        return '';
      }
    } catch (e) {
      print(
          "HATAAAAA !!!!!\ngetNotesDescription try catch içerisindeki e: $e     *****************");
    }
  }

  @override
  Future getNotesDescription() async {
    const String _baseUrl = 'http://10.0.2.2:80/notebook/get_notes.php';

    // const String _baseUrl = 'http://mce.epizy.com/notebook/get_notes.php';

    var _url = Uri.parse(_baseUrl);
    try {
      final response = await http.get(_url);

      // print(response);
      // // print("response body");
      // print(response.body);

      // // print("response isRedirect");
      // print(response.isRedirect); //false
      // // print("response persistentConnection");
      // print(response.persistentConnection); //trueS
      // // print("response reasonPhrase");
      // print(response.reasonPhrase); //ok
      // // print("response request ");
      // print(response.request);

      var noteListDescription = [];

      if (response.statusCode == 200) {
        var data = homeResponseModelFromJson(response.body);
        for (int i = 0; i < data.length; i++) {
          noteListDescription.add(data[i].description);
        }
        return noteListDescription;
      } else {
        return '';
      }
    } catch (e) {
      print(
          "HATAAAAA !!!!!\ngetNotesDescription try catch içerisindeki e: $e     *****************");
    }
  }

  @override
  Future getNotesDate() async {
    const String _baseUrl = 'http://10.0.2.2:80/notebook/get_notes.php';

    // const String _baseUrl = 'http://mce.epizy.com/notebook/get_notes.php';

    var _url = Uri.parse(_baseUrl);
    try {
      final response = await http.get(_url);

      // print(response);
      // // print("response body");
      // print(response.body);

      // // print("response isRedirect");
      // print(response.isRedirect); //false
      // // print("response persistentConnection");
      // print(response.persistentConnection); //trueS
      // // print("response reasonPhrase");
      // print(response.reasonPhrase); //ok
      // // print("response request ");
      // print(response.request);

      var noteListDate = [];

      if (response.statusCode == 200) {
        var data = homeResponseModelFromJson(response.body);
        for (int i = 0; i < data.length; i++) {
          noteListDate.add(data[i].date);
        }
        return noteListDate;
      } else {
        return '';
      }
    } catch (e) {
      print(
          "HATAAAAA !!!!!\ngetNotesDate try catch içerisindeki e: $e     *****************");
    }
  }

  Future getUserNotesTitle() async {
    const String _baseUrl = 'http://10.0.2.2:80/notebook/get_user_notes.php';

    // const String _baseUrl = 'http://mce.epizy.com/notebook/get_user_notes.php';

    var _url = Uri.parse(_baseUrl);
    try {
      final response = await http.post(
        _url,
        body: {"userId": userId.value},
      );

      // print(response);
      // // print("response body");
      // print(response.body);

      // // print("response isRedirect");
      // print(response.isRedirect); //false
      // // print("response persistentConnection");
      // print(response.persistentConnection); //trueS
      // // print("response reasonPhrase");
      // print(response.reasonPhrase); //ok
      // // print("response request ");
      // print(response.request);

      var noteListTitle = [];

      if (response.statusCode == 200) {
        var data = homeResponseModelFromJson(response.body);
        for (int i = 0; i < data.length; i++) {
          noteListTitle.add(data[i].title);
        }
        return noteListTitle;
      } else {
        return '';
      }
    } catch (e) {
      print(
          "HATAAAAA !!!!!\ngetNotesDescription try catch içerisindeki e: $e     *****************");
    }
  }

  @override
  Future getUserNotesDescription() async {
    const String _baseUrl = 'http://10.0.2.2:80/notebook/get_user_notes.php';

    // const String _baseUrl = 'http://mce.epizy.com/notebook/get_user_notes.php';

    var _url = Uri.parse(_baseUrl);
    try {
      final response = await http.post(
        _url,
        body: {"userId": userId.value},
      );

      // print(response);
      // // print("response body");
      // print(response.body);

      // // print("response isRedirect");
      // print(response.isRedirect); //false
      // // print("response persistentConnection");
      // print(response.persistentConnection); //trueS
      // // print("response reasonPhrase");
      // print(response.reasonPhrase); //ok
      // // print("response request ");
      // print(response.request);

      var noteListDescription = [];

      if (response.statusCode == 200) {
        var data = homeResponseModelFromJson(response.body);
        for (int i = 0; i < data.length; i++) {
          noteListDescription.add(data[i].description);
        }
        return noteListDescription;
      } else {
        return '';
      }
    } catch (e) {
      print(
          "HATAAAAA !!!!!\ngetUserNotesDescription try catch içerisindeki e: $e     *****************");
    }
  }

  @override
  Future getUserNotesDate() async {
    const String _baseUrl = 'http://10.0.2.2:80/notebook/get_user_notes.php';

    // const String _baseUrl = 'http://mce.epizy.com/notebook/get_user_notes.php';

    var _url = Uri.parse(_baseUrl);
    try {
      final response = await http.post(
        _url,
        body: {"userId": userId.value},
      );

      // print(response);
      // // print("response body");
      // print(response.body);

      // // print("response isRedirect");
      // print(response.isRedirect); //false
      // // print("response persistentConnection");
      // print(response.persistentConnection); //trueS
      // // print("response reasonPhrase");
      // print(response.reasonPhrase); //ok
      // // print("response request ");
      // print(response.request);

      var noteListDate = [];

      if (response.statusCode == 200) {
        var data = homeResponseModelFromJson(response.body);
        for (int i = 0; i < data.length; i++) {
          noteListDate.add(data[i].date);
        }
        return noteListDate;
      } else {
        return '';
      }
    } catch (e) {
      print(
          "HATAAAAA !!!!!\ngetUserNotesDate try catch içerisindeki e: $e     *****************");
    }
  }
}
