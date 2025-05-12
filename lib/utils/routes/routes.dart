import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/utils/routes/route_name.dart';
import 'package:task_manager/view/task_details_view.dart';

import '../../view/home_view.dart';
import '../../view/login_view.dart';
import '../../view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteName.splashView:
        return MaterialPageRoute(builder: (BuildContext context) => SplashView());
      case RouteName.loginView:
        return MaterialPageRoute(builder: (BuildContext context) => LoginView());
      case RouteName.homeView:
        return MaterialPageRoute(builder: (BuildContext context) => HomeView());
      case RouteName.taskDetailsView:
        final taskId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (BuildContext context) => TaskDetailsView(taskId: taskId),
        );
        
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('No Route Found'),)
              ],
            ),
          );
        });
    }
  }
}