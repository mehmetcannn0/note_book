import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class DioManager {
  late Dio dio;
  static const String _baseUrl = 'http://10.0.2.2:80/';

  // static const String _baseUrl = 'http://mce.epizy.com/';

  DioManager() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
      ),
    );

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient clinet) {
      clinet.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return null;
    };
  }
}
