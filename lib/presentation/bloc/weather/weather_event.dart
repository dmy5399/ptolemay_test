part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class WeatherLoadEvent implements WeatherEvent {}
