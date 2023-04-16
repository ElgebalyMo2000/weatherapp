
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/weather_provider.dart';
import 'package:weatherapp/services/weather_services.dart';

import '../models/weather_models.dart';

class SearchPage extends StatelessWidget {
 

 String? cityName;

  @override
  Widget build(BuildContext context) {
   // ignore: prefer_const_constructors
  
   return Scaffold(
    appBar: AppBar(
      title: Text('Search a City'),
    ),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          onChanged: (value) {
            cityName=value;
          },
          onSubmitted: (value) async {
            cityName=value;
            WeatherServices services = WeatherServices();
           WeatherModels? model=await services.getWeather(cityName: cityName!);
           Provider.of<WeatherProvider>(context,listen: false).weatherModels = model ;
           Provider.of<WeatherProvider>(context,listen: false).cityName = cityName ;

           
           Navigator.pop(context);


           
          },
      
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'search a city',
            label: Text('Search'),
            suffixIcon: GestureDetector(
              child: Icon(Icons.search),
              onTap:() async {
            WeatherServices services = WeatherServices();
           WeatherModels? model=await services.getWeather(cityName: cityName!);
           Provider.of<WeatherProvider>(context,listen: false).weatherModels = model ;
           Provider.of<WeatherProvider>(context,listen: false).cityName = cityName ;

           
           Navigator.pop(context);


           
          }, 
              ),
            contentPadding: EdgeInsets.symmetric(vertical: 40,horizontal: 24),
          ),
        ),
      ),
     
    ),
      
   );
  }
}
