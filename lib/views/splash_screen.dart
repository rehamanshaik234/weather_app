import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_report/utils/routes/routes_name.dart';

import '../app_constants/colors.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushNamedAndRemoveUntil(context, RoutesName.homeScreen, (route) => false);
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('#612FAB').withOpacity(0.3),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Weather Report',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 20.sp,color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}
