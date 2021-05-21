class MainWeather {
  final num temp;
  final num feelsLike;
  final num tempMin;
  final num tempMax;
  final num pressure;
  final num humidity;

  MainWeather(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  factory MainWeather.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return MainWeather();
    }

    return MainWeather(
      temp: json['temp'],
      feelsLike: double.parse(json['feels_like'].toString()),
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}
