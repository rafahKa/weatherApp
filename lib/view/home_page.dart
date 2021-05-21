import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_unfi/view/detail_page.dart';
import 'package:weather_unfi/view_model/home_view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: GetBuilder<HomeController>(
        init: Get.find(),
        builder: (controller) => controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : Column(children: [
                Container(
                  height: 280,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/1.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(top: 50, left: 20, right: 20),
                          child: Card(
                            color: Colors.white,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Text('dubai'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.grey)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Text(
                                      DateFormat()
                                          .add_MMMMEEEEd()
                                          .format(DateTime.now()),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18)),
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        children: [
                                          Text(
                                            (controller.currentWeatherData[0]
                                                        .weather !=
                                                    null)
                                                ? '${controller.currentWeatherData[0].weather[0].description}'
                                                : '',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            (controller.currentWeatherData[0]
                                                        .main !=
                                                    null)
                                                ? '${(controller.currentWeatherData[0].main.temp - 273.15).round().toString()}\u2103'
                                                : '',
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            (controller.currentWeatherData[0]
                                                        .main !=
                                                    null)
                                                ? 'min: ${(controller.currentWeatherData[0].main.tempMin - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData[0].main.tempMax - 273.15).round().toString()}\u2103'
                                                : '',
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image:
                                                    AssetImage('assets/2.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              (controller.currentWeatherData[0]
                                                          .wind !=
                                                      null)
                                                  ? 'wind ${controller.currentWeatherData[0].wind.speed} m/s'
                                                  : '',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'Weather Details',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                Container(
                  height: 150,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => VerticalDivider(
                      color: Colors.transparent,
                      width: 5,
                    ),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 140,
                        height: 150,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(DetailPage(),
                                arguments:
                                    controller.currentWeatherData[index * 8]);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        'Date: ${controller.currentWeatherData[index * 8].dateTime}'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 8.0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          controller
                                                      .currentWeatherData[
                                                          index * 8]
                                                      .weather[0]
                                                      .main ==
                                                  'Rain'
                                              ? 'assets/rain.png'
                                              : controller
                                                          .currentWeatherData[
                                                              index * 8]
                                                          .weather[0]
                                                          .main ==
                                                      'Clear'
                                                  ? 'assets/sun.png'
                                                  : controller
                                                              .currentWeatherData[
                                                                  index * 8]
                                                              .weather[0]
                                                              .main ==
                                                          'Clouds'
                                                      ? 'assets/cloud.png'
                                                      : 'assets/cloud.png',
                                          width: 25,
                                          height: 25,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                            '${(controller.currentWeatherData[index * 8].main.temp - 273.15).round().toString()}\u2103'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ]),
      ),
    );
  }
}
