import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ptolemay_test/core/util/dio_singleton.dart';
import 'package:ptolemay_test/domain/datasources/weather_datasource.dart';
import 'package:ptolemay_test/domain/models/weather/weather_model.dart';

class WeatherRemoteDataSource implements WeatherDataSource{

  @override
  Future<WeatherModel> getWeatherForLoc(String lat, String lon) async {

    try{
      Response res = await DioSingleton().instance().get('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=2326bb344551950d645e91890bd120ed&units=metric');

      return WeatherModel.fromJson(res.data);
    } catch (e) {
      log("${e}");
    }

    throw UnimplementedError();
  }

}