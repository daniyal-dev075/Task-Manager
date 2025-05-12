import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/utils/routes/route_name.dart';
import 'package:task_manager/utils/routes/routes.dart';
import 'package:task_manager/view_model/password_view_model.dart';
import 'package:task_manager/view_model/task_view_model.dart';
import 'package:task_manager/view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PasswordViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => TaskViewModel())
      ],
      child: ScreenUtilInit(
        designSize: Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RouteName.splashView,
            onGenerateRoute: Routes.generateRoute,
          );
        },
      ),
    );
  }
}
