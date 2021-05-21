import 'package:get/get.dart';

import 'package:weather_unfi/view_model/home_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
