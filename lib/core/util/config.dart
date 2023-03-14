import 'dart:io';
import 'package:ptolemay_test/core/util/dio_singleton.dart';
import 'package:dio/io.dart';

class Config {
  static Future<void> init() async {
    _initDio();
  }

  static void _initDio() {
    (DioSingleton().instance().httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

}