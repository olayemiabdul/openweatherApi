import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location_app/weather.dart';

import 'city_screen.dart';
import 'constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen(this.locationWeather);
  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  // properties to be display on UI
  late int temperature;
  late String weatherIcon;
  late String cityName;
  late String weatherMessage;
  WeatherModel abdulWeather = WeatherModel();
  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
  }

// to update the UI
//   wrap in setState to reflect the update
  @override
  void updateUi(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = abdulWeather.getWeatherIcon(condition);
      cityName = weatherData['name'];
      weatherMessage = abdulWeather.getMessage(temperature);
      // print(temperature);
      // print(condition);
      // print(cityName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.center,
            image: AssetImage(
              "images/location_background.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 40.0,
          horizontal: 25.0,
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      var weatherData = await abdulWeather.getLocationData();
                      updateUi(weatherData);
                    },
                    // Navigator.pop(context);

                    // to pop the screen back to current location

                    child: Icon(
                      Icons.near_me,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      // this will push the city type in the textfield to the city screen page
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }),
                      );
                      // this will check if city is typed in the textfield and get the current weather condition
                      // and display on it on the cityscreen page
                      if (typedName != null) {
                        var weatherData =
                            await abdulWeather.getCityWeather(typedName);
                        updateUi(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 15.0,
                ),
                child: Text(
                  '$weatherMessage in $cityName!',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
