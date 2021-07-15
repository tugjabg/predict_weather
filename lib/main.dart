import 'package:flutter/material.dart';
import 'package:predict_weather/presentation/weather_screen/weather_detail_screen.dart';

import 'input_location_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InLocationScreen(),
    );
  }
}


