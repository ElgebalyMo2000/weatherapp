import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/weather_cubit/weather_state.dart';
import 'package:weatherapp/models/weather_models.dart';
import 'package:weatherapp/services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherState>{
 

  WeatherServices weatherServices;
  WeatherModels? weatherModels;
  String? cityName;

  WeatherCubit(this.weatherServices):super(WeatherIntal());

  void getWeather({required String cityName})async{

    emit(WeatherLoading());

   try {
 weatherModels = await weatherServices.getWeather(cityName: cityName);
  emit(WeatherSuccess());
} on Exception catch (e) {
 emit(WeatherFailure());
}

   


  }


}