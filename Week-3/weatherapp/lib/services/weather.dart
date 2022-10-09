import 'package:http/http.dart';
import 'dart:convert';

class Weather {
  String? temp;
  String? weather;
  String location;
  Weather ({required this.location});
  Future <void> getWeather () async {
    try {
      Map weatherMap = jsonDecode((await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=e19781eff66942c6cc4447dfc2f505eb'))).body);
      weather = weatherMap['weather'][0]['main'];
      temp = ((weatherMap['main']['temp'] - 273.15) + 0.5).toInt().toString() + '°C';
    }
    catch (error) {
      print('Caught error $error');
      temp = 'N/A';
    }
  }
}