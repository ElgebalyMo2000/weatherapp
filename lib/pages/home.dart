import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/cubit/weather_cubit/weather_cubit.dart';
import 'package:weatherapp/cubit/weather_cubit/weather_state.dart';
import 'package:weatherapp/models/weather_models.dart';
import 'package:weatherapp/pages/search_Page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../providers/weather_provider.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

WeatherModels? weatherData;

  @override
  Widget build(BuildContext context) {
   
    
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


        body:BlocBuilder<WeatherCubit,WeatherState>(builder: (context,state){

          if(state is WeatherLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state is WeatherSuccess){
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModels;
            return Container(
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
          Text(BlocProvider.of<WeatherCubit>(context).cityName!,style: TextStyle(fontSize: 30),),
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
    );
          }
          else if(state is WeatherFailure){
            return Center(
              child: Text(
              'there is City with this name please enter City name correctly',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            );
          }
          else{
            return Center(
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
            );
          }
        }) ,

       
    );
  }
}