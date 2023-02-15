import 'package:http/http.dart' as http;
import 'package:note_book/data/services/search/model/search_request_model.dart';
import 'package:note_book/data/services/search/model/search_response_model.dart';

abstract class SearchService {
  Future search(SearchRequestModel searchRequestModel);
}

class SearchServiceImp extends SearchService {
  @override
  Future search(SearchRequestModel searchRequestModel) async {
    const String _baseUrl = 'http://10.0.2.2:80/notebook/search.php';

    // const String _baseUrl = 'http://mce.epizy.com/notebook/search.php';

    var _url = Uri.parse(_baseUrl);
    //try {
    final response = await http.post(_url, body: searchRequestModel.toJson());

    var noteListTitle = [];

    print("search service sayfasi response: ");
    print("searchRequestModel.toJson()");
    print(searchRequestModel.toJson());
    print(response);
    print("response body");
    print(response.body); //! burda sıkıntı var body gelmıyor
    print("response headers");
    print(response.headers);
    print("response isRedirect");
    print(response.isRedirect); //false
    print("response persistentConnection");
    print(response.persistentConnection); //trueS
    print("response reasonPhrase");
    print(response.reasonPhrase); //ok
    print("response request ");
    print(response.request);
    print("response statusCode");
    print(response.statusCode);

    print("respons kısmını bitti printler");

    if (response.statusCode == 200) {
      // print('arama başarılı');

      // print("json bastırma ");

      // // print(registerRequestModel.toJson());
      // print("json bastırılamadı ...");

      // print("json bastırıldı");
      // print("returnden once :");

      var data = searchResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        noteListTitle.add(data[i].title);
      }

      return noteListTitle;
    } else {
      return '';
    }
    // } catch (e) {
    // print(
    //     "*********************** \ntry catch içerisindeki e:\n..$e ..   \n*****************");
    // }
  }
}
 
 
/*
abstract class RegisterService {
  Future register(RegisterRequestModel registerRequestModel);
}

class RegisterServiceImp extends RegisterService {
  final Dio _dio;
  RegisterServiceImp(DioManager _dioManager) : _dio = _dioManager.dio;
  //null safety den dolayı yazdık dio nun basına late yazmak yerıne

  @override
  Future register(RegisterRequestModel registerRequestModel) async {
    // return _dio
    //     .post(
    //       "notebook/register.php",
    //       data: registerRequestModel.toJson(),
    //     )
    //     .then((response) => registerResponseModelFromJson(response.data));

    const String _baseUrl = 'http://10.0.2.2:80/notebook/register.php';
    var _url = Uri.parse(_baseUrl);

    print("uri li sayfada post oncesı ......********");
    // var header = {'Content-Type': 'application/json', 'Charset': 'utf-8'};

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };

    // final bodyy = jsonEncode(registerRequestModel.toJson());
    //registerRequestModel.toJson()

    var bodyy = jsonEncode({
      'username': registerRequestModel.username,
      'email': registerRequestModel.email,
      'book': registerRequestModel.book,
      'password': registerRequestModel.password
    });
*/
/*
    print("register service sayfasi response oncesi: ");
    try {
      final response = await http.post(_url, body: bodyy, headers: header);
      print("register service sayfasi response: ");
      // print(response);
      print("response body");
      print(response.body);
      // print("response headers");
      // print(response.headers);
      // print("response isRedirect");
      // print(response.isRedirect); //false
      // print("response persistentConnection");
      // print(response.persistentConnection); //trueS
      // print("response reasonPhrase");
      // print(response.reasonPhrase); //ok
      print("response request ");
      print(response.request);
      print("response statusCode");
      print(response.statusCode);

      print("respons kısmını bitti printler");
      if (response.statusCode == 200) {
        print("Kayıt basarılı");
        print("json bastırma ");

        print(registerRequestModel.toJson());

        print("json bastırıldı");
        print("returnden once :");

        return registerResponseModelFromJson(response.body);
        // return bodyy;
      } else {
        print("uri sayfasi else kısmı bos string sayfası");
        return "";
      }
    } catch (e) {
      print(
          "*********************** \ntry catch içerisindeki e: $e    \n*****************");
    }
  }
}
*/