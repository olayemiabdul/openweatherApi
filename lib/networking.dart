import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  final url;

  NetworkHelper(this.url);

  Future getData() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      var jsondecoder = jsonDecode(data);
      return jsondecoder;
    } else {
      print(response.statusCode);
    }
  }
}
