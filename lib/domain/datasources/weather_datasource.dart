import 'package:ptolemay_test/domain/models/weather/weather_model.dart';

abstract class WeatherDataSource {
  Future<WeatherModel> getWeatherForLoc(String lat, String lon);
}