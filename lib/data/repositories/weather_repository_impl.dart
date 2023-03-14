import 'package:ptolemay_test/data/datasources/weather/weather_remote_datasource.dart';
import 'package:ptolemay_test/domain/datasources/weather_datasource.dart';
import 'package:ptolemay_test/domain/models/weather/weather_model.dart';
import 'package:ptolemay_test/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {

  @override
  Future<WeatherModel> getWeatherForLoc(String lat, String lon) async {
    WeatherDataSource dataSource = WeatherRemoteDataSource();

    try {
      return await dataSource.getWeatherForLoc(lat, lon);
    } catch (_) {
      throw UnimplementedError();
    }
  }

}