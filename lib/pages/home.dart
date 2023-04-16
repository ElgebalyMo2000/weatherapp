import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_models.dart';
import 'package:weatherapp/pages/search_Page.dart';

import '../providers/weather_provider.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
WeatherModels? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherModels ;
    
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:(context) =>
           SearchPage(
           ),
           ));
        },icon: Icon(Icons.search),)],
        title: Text('Weather App'),
        ),
        body:weatherData ==null? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const Text(
              'searchiiiiing now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
    ):Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:[
            weatherData!.getBackgroundColor()! ,
            weatherData!.getBackgroundColor()!.withOpacity(.3) ,
            weatherData!.getBackgroundColor()!.withOpacity(.1) ,

          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
           ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 3,),
          Text(Provider.of<WeatherProvider>(context,listen: false).cityName!,style: TextStyle(fontSize: 30),),
          Text('updated at ${weatherData!.date!}',style: TextStyle(fontSize: 15),),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData!.getImage()!),
              Text(weatherData!.temp!.toInt().toString(),style: TextStyle(fontSize: 30),),
              Column(
                children: [
                  Text('Max temp: ${weatherData!.maxTemp!.toInt()}',style: TextStyle(fontSize: 15),),
                  Text('Min temp: ${weatherData!.minTemp!.toInt()}',style: TextStyle(fontSize: 15),),
                ],
              )
              
            ],
          ),
          Spacer(),
         Text(weatherData!.condition!,style: TextStyle(fontSize: 30),),
         Spacer(flex: 5,),
        ],
    
    
      ),
    ),
    );
  }
}