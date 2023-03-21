import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Location(this.latitude, this.longitude);

  Future getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
// double temperature = jsondecoder['main']['temp'];
//
// String condition = jsondecoder(data)['weather'][0]['main'];
//
// String cityName = jsondecoder(data)['name'];
// print(temperature);
// print(condition);
// print(cityName);
