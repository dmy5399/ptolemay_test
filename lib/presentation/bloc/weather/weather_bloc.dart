import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ptolemay_test/core/util/location.dart';
import 'package:ptolemay_test/data/repositories/weather_repository_impl.dart';
import 'package:ptolemay_test/domain/models/weather/weather_model.dart';
import 'package:ptolemay_test/domain/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherLoadEvent>((event, emit) async {
      WeatherRepository weatherRepository = WeatherRepositoryImpl();

      emit(WeatherLoading());

      try {

        Map<String, String> location = await LocationUtil.getCurrentLoc();

        if(location.isEmpty) throw Exception();

        WeatherModel weather = await weatherRepository.getWeatherForLoc(location['lat']!, location['lon']!);

        emit(WeatherLoaded(weather));

      } catch (_) {

      }
    });
  }
}
