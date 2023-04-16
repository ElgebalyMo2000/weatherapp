import 'package:flutter/material.dart';

class WeatherModels{

   String? date;
   double? temp;
   double? maxTemp;
   double? minTemp;
   String? condition;

  WeatherModels({required this.date,required this.temp,required this.maxTemp, required this.minTemp,required this.condition});

 factory WeatherModels.fromJson(dynamic data){
    var jsondata=data['forecast']['forecastday'][0]['day'];
    return WeatherModels(
      date: data['location']['localtime'], 
      temp: jsondata['avgtemp_c'],
       maxTemp: jsondata['maxtemp_c'], 
       minTemp: jsondata['mintemp_c'], 
       condition: jsondata['condition']['text']);
  }
  
  String? getImage(){

    if(condition=='Light rain')
      return 'assets/images/rainy.png';

   else if(condition=='Sunny')
      return 'assets/images/clear.png';

   else if(condition=='Partly cloudy')
      return 'assets/images/cloudy.png';   

   else if(condition=='Overcast')
      return 'assets/images/cloudy.png';

   else if(condition=='Patchy rain possible')
     return 'assets/images/rainy.png';

   else
   return 'assets/images/clear.png';   
  }


  MaterialColor? getThemeColor(){

    if(condition=='Light rain' || condition=='Partly cloudy'||condition=='Patchy rain possible')
      return Colors.lightBlue;

   else if(condition=='Sunny')
      return Colors.orange;

   else if(condition=='Overcast')
      return Colors.blueGrey;

   else
   return Colors.blue;   
  }

   Color? getBackgroundColor(){

    if(condition=='Light rain' || condition=='Partly cloudy'||condition=='Patchy rain possible')
      return Colors.lightBlue;

   else if(condition=='Sunny')
      return Colors.orange;

   else if(condition=='Overcast')
      return Colors.blueGrey;

   else
   return Colors.blue;   
  }

}