import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/app_colors.dart';
import '../view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.backgroundColour,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideInUp(
            duration: Duration(seconds: 4),
            child:  Center(child: Text('Task',style: TextStyle(color: Colors.red,fontSize: 32.sp),),),),
          SlideInDown(
              duration: Duration(seconds: 4),
              child: Center(child: Text('Breeze',style: TextStyle(color: AppColours.buttonColour,fontSize: 32.sp),),))
        ],
      ),
    );
  }
}
