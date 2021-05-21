import 'package:weather_unfi/api/api_repository.dart';
import 'package:weather_unfi/models/current_weather_model.dart';


class WeatherService {
  
  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=0c528cf1c0035e6d0762c3a12e765782';

  void getCurrentWeatherData({
    Function() beforSend,
    Function(List<CurrentWeatherData> currentWeatherData) onSuccess,
    Function(dynamic error) onError,
  }) {
    final url = '$baseUrl/forecast?id=292223&$apiKey';
    print(url);
    ApiRepository(url: '$url', payload: null).get(
        beforeSend: () => {
              if (beforSend != null)
                {
                  beforSend(),
                },
            },
        onSuccess: (data) => {
              onSuccess((data['list'] as List)
                      ?.map((t) => CurrentWeatherData.fromJson(t))
                      ?.toList() ??
                  List.empty()),
            },
        onError: (error) => {
              if (onError != null)
                {
                  print(error),
                  onError(error),
                }
            });
  }
}
