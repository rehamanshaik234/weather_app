import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_report/providers/weather_provider.dart';
import 'package:weather_report/utils/routes/routes.dart';
import 'package:weather_report/utils/routes/routes_name.dart';
import 'package:weather_report/views/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Weather()),
    ],
    child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430,932),
      builder: (context,child) {
        return MaterialApp(
          title: 'Flutter Demo',
          initialRoute: RoutesName.splashScreen,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: Routes.generateRoute,
        );
      }
    );
  }
}
