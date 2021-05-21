import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_unfi/view/home_page.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Get.off(HomePage());
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage(
                  'assets/1.jpg',
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image.asset(
                  Get.arguments.weather[0].main == 'Rain'
                      ? 'assets/rain.png'
                      : Get.arguments.weather[0].main == 'Clear'
                          ? 'assets/sun.png'
                          : Get.arguments.weather[0].main == 'Clouds'
                              ? 'assets/cloud.png'
                              : 'assets/cloud.png',
                  width: 100,
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    '${Get.arguments.weather[0].description}'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Tempreture: ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Text(
                    (Get.arguments.main != null)
                        ? '${(Get.arguments.main.temp - 273.15).round().toString()}\u2103'
                        : '',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Text('Feels like: ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Text(
                    (Get.arguments.main != null)
                        ? '${(Get.arguments.main.feelsLike - 273.15).round().toString()}\u2103'
                        : '',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Text('Min: ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Text(
                    (Get.arguments.main != null)
                        ? '${(Get.arguments.main.tempMin - 273.15).round().toString()}\u2103 '
                        : '',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Text('Max: ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Text(
                    (Get.arguments.main != null)
                        ? '${(Get.arguments.main.tempMax - 273.15).round().toString()}\u2103'
                        : '',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Text('Humidity: ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Text(
                    (Get.arguments.main != null)
                        ? '${Get.arguments.main.humidity}%'
                        : '',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Text('Wind Speed: ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Text(
                    (Get.arguments.main != null)
                        ? '${Get.arguments.wind.speed} m/s'
                        : '',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Text('Clouds: ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Text(
                    (Get.arguments.main != null)
                        ? '${Get.arguments.clouds.all}'
                        : '',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Text('For Date: ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Text(
                    (Get.arguments.main != null)
                        ? '${Get.arguments.dateTime}'
                        : '',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
