import 'dart:convert';

import 'package:get/get.dart';
import 'package:predict_weather/helper/dio_base.dart';
import 'package:predict_weather/models/detail_weather.dart';
import 'package:predict_weather/utilities/contraints.dart';

class ControllerWeather extends GetxController {
  DetailWeather detailWeather;
  double lat;
  DateTime dateTimeNow;
  double long;

  ControllerWeather(this.lat, this.long);

  final _dioBase = DioBase.getDio();
  final isLoading = true.obs;

  @override
  void onInit() async {
    await getDataWeather();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getDataWeather() async {
    isLoading.value = true;
    dateTimeNow = DateTime.now();
    final _weatherJson = await _dioBase.getUri(Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$weatherAPIKey'));
    print('_weatherJson : ${_weatherJson.runtimeType}');
    detailWeather =
        DetailWeather.fromJson(json.decode(_weatherJson.toString()));
    isLoading.value = false;
  }
}
