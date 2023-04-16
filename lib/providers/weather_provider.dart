import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_models.dart';

class WeatherProvider extends ChangeNotifier{

  WeatherModels? _weatherModels;

  String? cityName;

  void set weatherModels(WeatherModels? weather){
    _weatherModels = weather;

    notifyListeners();
  }
  
  WeatherModels? get weatherModels{
    return _weatherModels;
  }

}