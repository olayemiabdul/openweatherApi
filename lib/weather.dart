import 'package:location_app/location.dart';

import 'networking.dart';

const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const apiKeys = 'b62e7cd8d4257ba32740e1c17262f062';

class WeatherModel {
  // to get weather condition for the type city name in the textfield
  Future getCityWeather(String cityName) async {
    NetworkHelper abdulNetwork = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKeys&units=metric');

    var weatherData = await abdulNetwork.getData();
    return weatherData;
  }

  // to get weather condition for the current location using geolocator package
  Future getLocationData() async {
    Location abdulLocation = Location(12.023844, 8.5474425);
    await abdulLocation.getCurrentLocation();
    NetworkHelper abdulNetwork = NetworkHelper(
        '$openWeatherMapURL?lat=${abdulLocation.latitude}&lon=${abdulLocation.longitude}&appid=$apiKeys&units=metric');
    var weatherData = await abdulNetwork.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
