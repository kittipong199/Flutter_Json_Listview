// json

import 'dart:developer';

import 'package:http/http.dart' as http;

String endpoint =
    "https://api.openweathermap.org/data/2.5/weather?q=London&units=metric&appid=92f90171a9639b008090aa98c05df965";

Future<http.Response?>  getCityWeather() async {
  // buld url
  try {
    Uri uri = Uri.parse(endpoint);

    // coll GET

    final response = await http.get(uri);
    // log(Response.body);

    // retrun data

    return response;
  } catch (e) {
    return null;
  }
}
