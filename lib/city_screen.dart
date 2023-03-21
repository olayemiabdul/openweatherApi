import 'package:flutter/material.dart';
import 'package:location_app/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.center,
            image: AssetImage(
              "images/city_background.jpg",
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
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // to pop the screen back to current location
                  },
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kLabelStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
