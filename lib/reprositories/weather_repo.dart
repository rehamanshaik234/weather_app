import 'package:http/http.dart' as http;
import 'package:weather_report/app_constants/api_response.dart';
import 'package:weather_report/app_constants/constants.dart';
import 'package:weather_report/app_constants/error_response.dart';
import 'package:weather_report/utils/app_urls.dart';
class WeatherRepo{

  Future<ApiResponse> getWeatherData(String lat, String lon)async{
    http.Response response= await http.get(Uri.parse("${AppUrl.weatherApi}lat=$lat&lon=$lon&appid=$accessToken"));
    if(response.statusCode==200){
      print(response.body);
      return ApiResponse.withSuccess(response);
    }else{
      return ApiResponse.withError(ApiErrorHandler.getMessage(response));
    }
  }
}