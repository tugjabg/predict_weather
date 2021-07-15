import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:predict_weather/presentation/weather_screen/weather_view_model.dart';
import 'package:weather_icons/weather_icons.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Get.put(ControllerWeather(
        double.parse(Get.arguments[0]), double.parse(Get.arguments[1])));
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(34, 51, 94, 1),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Obx(() {
        if (viewModel.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.2,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
                color: Color.fromRGBO(34, 51, 94, 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    viewModel.detailWeather.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    viewModel.detailWeather.sys.country,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(
                            WeatherIcons.day_cloudy,
                            color: Colors.white,
                            size: 70.0,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Text(
                        ' ${(viewModel.detailWeather.main.temp - 273).toInt()}°C',
                        style: TextStyle(color: Colors.white, fontSize: 70),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 120,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          WeatherIcons.raindrop,
                          size: 30,
                          color: Color.fromRGBO(34, 51, 94, 1).withOpacity(0.8),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${viewModel.detailWeather.main.humidity} %',
                          style: TextStyle(
                              color: Color.fromRGBO(34, 51, 94, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Icon(
                    //       WeatherIcons.wind,
                    //       size: 30,
                    //       color: Color.fromRGBO(34, 51, 94, 1).withOpacity(0.8),
                    //     ),
                    //     SizedBox(
                    //       height: 10,
                    //     ),
                    //     Text(
                    //       '${widget.viewModel.detailWeather.wind.speed} mph',
                    //       style: TextStyle(
                    //           color: Color.fromRGBO(34, 51, 94, 1),
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 20),
                    //     ),
                    //   ],
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          WeatherIcons.sandstorm,
                          size: 30,
                          color: Color.fromRGBO(34, 51, 94, 1).withOpacity(0.8),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${viewModel.detailWeather.wind.speed} mph',
                          style: TextStyle(
                              color: Color.fromRGBO(34, 51, 94, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 170,
              color: Color.fromRGBO(245, 245, 245, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${viewModel.dateTimeNow.hour}:${viewModel.dateTimeNow.minute}',
                    style: TextStyle(
                        fontSize: 45,
                        color: Color.fromRGBO(34, 51, 94, 1),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${viewModel.dateTimeNow.day}/${viewModel.dateTimeNow.month}/${viewModel.dateTimeNow.year}',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromRGBO(34, 51, 94, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
