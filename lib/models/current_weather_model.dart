import 'package:weather_unfi/models/cloud_model.dart';
import 'package:weather_unfi/models/main_weather_model.dart';
import 'package:weather_unfi/models/weather_model.dart';
import 'package:weather_unfi/models/wind_model.dart';

class CurrentWeatherData {
  final List<Weather> weather;
  final MainWeather main;
  final num visibility;
  final Wind wind;
  final Clouds clouds;
  final String dateTime;
  final String fulldate;

  CurrentWeatherData(
      {this.weather,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dateTime,
      this.fulldate});

  factory CurrentWeatherData.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherData(
        weather: (json['weather'] as List)
                ?.map((w) => Weather.fromJson(w))
                ?.toList() ??
            List.empty(),
        main: MainWeather.fromJson(json['main']),
        visibility: json['visibility'],
        wind: Wind.fromJson(json['wind']),
        clouds: Clouds.fromJson(json['clouds']),
        dateTime: json['dt_txt'].split(' ')[0],
      );

  Map<String, dynamic> toJson() {
    return {
      'weather': List<dynamic>.from(weather.map((x) => x.toJson())),
      'main': main,
      'visibility': visibility,
      'wind': wind,
      'clouds': clouds,
      'humidity': main.humidity,
      'dt_txt': dateTime,
    };
  }
}
