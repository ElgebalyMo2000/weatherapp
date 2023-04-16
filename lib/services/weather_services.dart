
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_models.dart';
class WeatherServices{
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'a79e62d677d84ecb8e5222737232501';

  Future<WeatherModels?> getWeather({required String cityName})async{
    WeatherModels? model;
    try {
  Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
  
     http.Response response=await http.get(url);
  
     Map<String,dynamic> data = jsonDecode(response.body);
  
     
  
      model = WeatherModels.fromJson(data);
}  catch (e) {
  // TODO
  print(e);
}
    

    return model;
  }
}