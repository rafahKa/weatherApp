import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_unfi/utlis/bindings.dart';
import 'package:weather_unfi/view/home_page.dart';
import 'package:weather_unfi/view_model/home_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(HomeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
