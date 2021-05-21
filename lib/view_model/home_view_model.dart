import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather_unfi/models/current_weather_model.dart';
import 'package:weather_unfi/services/weather_service.dart';

class HomeController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CurrentWeatherData> get currentWeatherData => _currentWeatherData;
  List<CurrentWeatherData> _currentWeatherData = [];

  HomeController() {
    getCurrentWeatherData();
  }
  @override
  void onInit() {
    initState();
    super.onInit();
  }

  void initState() {
    getCurrentWeatherData();
  }

  getCurrentWeatherData() async {
    _loading.value = true;

    WeatherService().getCurrentWeatherData(
        onSuccess: (data) async {
          _currentWeatherData = data;

          _loading.value = false;

          update();
        },
        onError: (error) => {
              print('no internet'),
              print(error),
              _loading.value = false,
              update(),
            });
  }
}
