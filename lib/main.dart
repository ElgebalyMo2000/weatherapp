import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/weather_cubit/weather_cubit.dart';
import 'package:weatherapp/pages/home.dart';
import 'package:weatherapp/pages/search_Page.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/weather_provider.dart';
import 'package:weatherapp/services/weather_services.dart';

import 'models/weather_models.dart';
void main() {
  runApp( BlocProvider(
    create: (context) {
       return WeatherCubit(WeatherServices());
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
       
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModels==null?Colors.blue:BlocProvider.of<WeatherCubit>(context).weatherModels!.getThemeColor(),
      ),
      home:  HomePage(), 
    );
  }
}

