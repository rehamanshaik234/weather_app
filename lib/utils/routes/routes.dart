import 'package:flutter/material.dart';
import 'package:weather_report/utils/routes/routes_name.dart';
import 'package:weather_report/views/home.dart';
import '../../views/splash_screen.dart';
class Routes{
  static Route<dynamic>generateRoute(RouteSettings settings){
    switch(settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) =>SplashScreen(),
            settings: settings);
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (BuildContext context) =>
            Home(), settings: settings);
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
              body:Center(
                child: Text("No Routes Found"),
              )
          );
        });
    }
  }
}