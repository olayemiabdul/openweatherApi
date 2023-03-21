import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:location_app/location_screen.dart';

import 'weather.dart';

const apiKeys = 'b62e7cd8d4257ba32740e1c17262f062';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // late double longititude;
  // late double latitutde;
  // and the above code too

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  // Future getLocationData() async {
  //   Location abdulLocation = Location(20.0, 10.0);
  //   await abdulLocation.getCurrentLocation();
  // because we have use ${abdulLocation.latitude} and ${abdulLocation.longitude},
  // we dont need this below code
  // longititude = abdulLocation.longitude;
  // latitutde = abdulLocation.latitude;
  // NetworkHelper abdulNetwork = NetworkHelper(
  //     '$openWeatherMapURL?lat=${abdulLocation.latitude}&lon=${abdulLocation.longitude}&appid=$apiKeys&units=metric');
  // var weatherData = await abdulNetwork.getData();
  // return weatherData;
  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationData();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(
          weatherData,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: SpinKitRotatingCircle(
        color: Colors.blue,
        size: 50.0,
      ),
      // appBar: AppBar(
      //   title: Text('Hello weather'),
      // ),
      // body: Center(
      //   child: FloatingActionButton(
      //     onPressed: () {},
      //     child: Text('Get location'),
      //   ),
    ), // ),
  );
}

// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//     );
//   }
