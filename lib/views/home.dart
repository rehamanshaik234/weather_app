import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_report/app_constants/colors.dart';
import 'package:weather_report/app_constants/constants.dart';
import 'package:weather_report/providers/weather_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    getLocation(context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('#612FAB').withOpacity(0.3),
        body: Consumer<Weather>(
          builder: (context,weather,child) {
            return weather.weatherData!=null?Stack(
              children: [
                Positioned(
                  top: 180.h,
                  left: -10.sp,
                  child: SizedBox(
                  height: 80.h,

                  child: Image.asset('assets/cloud.png',fit: BoxFit.fitHeight,),
                ),),
                Positioned(
                  top: 240.h,
                  right: 0.sp,
                  child: SizedBox(
                    height: 80.h,

                    child: Image.asset('assets/cloud.png',fit: BoxFit.fitHeight,),
                  ),),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100.h,

                        child: Image.asset('assets/cloud.png',fit: BoxFit.fitHeight,),
                      ),
                      Text('${weather.weatherData?.city!.name}',style: GoogleFonts.poppins(color: Colors.white,
                          fontWeight: FontWeight.w400,fontSize: 30.sp),),
                      Text("${getTemperature("${weather.weatherData?.list![0].main?.temp}")}°c",style: GoogleFonts.poppins(color: Colors.white,
                          fontWeight: FontWeight.w200,fontSize: 60.sp),),
                      Text("${weather.weatherData!.list![0].weather![0].description}",style: GoogleFonts.poppins(color: Colors.white,
                          fontWeight: FontWeight.w200,fontSize: 20.sp),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("H : ${getTemperature("${weather.weatherData?.list![0].main?.tempMax}")}°",style: GoogleFonts.poppins(color: Colors.white,
                              fontWeight: FontWeight.w400,fontSize: 20.sp),),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text("L : ${getTemperature("${weather.weatherData?.list![0].main?.tempMin}")}°",style: GoogleFonts.poppins(color: Colors.white,
                              fontWeight: FontWeight.w400,fontSize: 20.sp),),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 366.h,
                    child: Card(
                        color: Color.fromRGBO(179, 179, 202, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp),
                                topRight: Radius.circular(20.sp))
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 8.h,vertical: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Hourly Forecast',style: GoogleFonts.poppins(color: primaryColor,
                                      fontWeight: FontWeight.w600),),
                                ],
                              ),
                              SizedBox(height: 8.h,),
                              Divider(
                                color: HexColor('#612FAB').withOpacity(0.8),
                                height: 2.h,
                              ),
                              SizedBox(height: 16.h,),
                              Container(
                                height: 150.h,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: weather.weatherData!.list?.length,
                                    itemBuilder: (context,index){
                                      return SizedBox(
                                        width: 60.w,
                                        height: 120.h,
                                        child: Card(
                                          color: HexColor('#612FAB'),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30.sp)
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 8.h,),
                                              Text(getTime("${weather.weatherData!.list![index].dtTxt}"),style: GoogleFonts.poppins(
                                                  color: Color.fromRGBO(179, 179, 202, 1.0)),),
                                              BoxedIcon(WeatherIcons.cloudy,color:Color.fromRGBO(179, 179, 202, 1.0) ,),
                                              SizedBox(height: 8.h,),
                                              Text("${getTemperature("${weather.weatherData!.list![index].main!.temp}")}°c",style: GoogleFonts.poppins(
                                                  color: Color.fromRGBO(179, 179, 202, 1.0)),),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text("Country : ${weather.weatherData!.city!.country}",style: GoogleFonts.poppins(
                                  color: primaryColor),),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text("Population : ${weather.weatherData!.city!.population}",style: GoogleFonts.poppins(
                                  color: primaryColor),),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text("Sunrise : ${weather.weatherData!.city!.sunrise}",style: GoogleFonts.poppins(
                                  color: primaryColor),),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text("Sunset : ${weather.weatherData!.city!.sunset}",style: GoogleFonts.poppins(
                                  color: primaryColor),),
                            ],
                          ),
                        ),
                      ),
                  ),
                  ),
              ],
            ): Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
        ),
      ),
    );
  }

  Future<void> getLocation(BuildContext context)async{
    Location location =  Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    getWeatherData(_locationData);
  }

  void getWeatherData(LocationData locationData){
    context.read<Weather>().getWeatherData("${locationData.latitude}",'${locationData.longitude}');
  }

  String getTemperature(String temp){
    double temperature= double.parse(temp)-273.0;
    return temperature.toString().substring(0,2);
  }

  String getTime(String format) {
    if(format.contains("00:00:00")){
      return "12 AM";
    }else if(format.contains("03:00")){
      return "3 AM";
    } else if(format.contains("06:00")){
      return "6 AM";
    }else if(format.contains("09:00")){
      return "9 AM";
    }else if(format.contains("12:00")){
      return "12 PM";
    }else if(format.contains("15:00")){
      return "3 PM";
    }else if(format.contains("18:00")){
      return "6 PM";
    }else if(format.contains("21:00")){
      return "9 PM";
    }else{
      return '00 AM';
    }
  }
}
