import 'package:flutter/material.dart';
import 'package:weatherapp/pages/home.dart';
import 'package:weatherapp/pages/search_Page.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/weather_provider.dart';

import 'models/weather_models.dart';
void main() {
  runApp( ChangeNotifierProvider(
    create: (context) {
       return WeatherProvider();
    },
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  

  // This widget is the root of your application.
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
       
        primarySwatch: Provider.of<WeatherProvider>(context).weatherModels==null?Colors.blue:Provider.of<WeatherProvider>(context).weatherModels!.getThemeColor(),
      ),
      home:  HomePage(), 
    );
  }
}

