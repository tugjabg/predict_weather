import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:predict_weather/presentation/weather_screen/weather_detail_screen.dart';

class InLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String lat = '';
    String long = '';
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Input your location'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 100, right: 20, left: 20),
          height: 300,
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Nhập vào kinh độ'),
                onChanged: (value) {
                  long = value;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Nhập vào vĩ độ'),
                onChanged: (value) {
                  lat = value;
                },
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                child: Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.search, size: 20,),
                        SizedBox(width: 7,),
                        Text('Tìm kiếm', style: TextStyle(fontSize: 18),),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Get.to(DetailScreen(), arguments: [lat, long]);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
