import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:m_weather/weatherModel.dart';

class WeatherData {
  Future getData(var date) async {
    var uriCall = Uri.parse(
      "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Istanbul/$date/$date?unitGroup=metric&include=current&key=6AH3TDC9GVHYFTF9669HN9WAG&contentType=json");
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    var jsonbody = Weather.fromJson(body);
    //print("----qweqw----------");

    return jsonbody;
  }
}
