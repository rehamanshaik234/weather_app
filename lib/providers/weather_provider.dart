import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:weather_report/app_constants/api_response.dart';
import 'package:weather_report/models/WeatherModel.dart';
import 'package:weather_report/reprositories/weather_repo.dart';

class Weather with ChangeNotifier{
  int count=0;
  late ApiResponse response;
  WeatherModel? _weatherData;
  WeatherModel? get weatherData => _weatherData;
  String? apiResponse;
  Future<void> getWeatherData(String lat,String lon)async{
    response= await WeatherRepo().getWeatherData(lat, lon);
    if(response.response!.statusCode==200){
      apiResponse="success";
      notifyListeners();
      Map<String,dynamic> data= jsonDecode(response.response!.body);
      print(data['cod']);
      _weatherData =WeatherModel.fromJson(data);
      notifyListeners();
    }else{
      apiResponse=response.error;
      notifyListeners();
    }
  }
}
