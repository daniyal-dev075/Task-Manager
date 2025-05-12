import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../model/user_model.dart';
import '../../utils/routes/route_name.dart';
import '../user_view_model.dart';

class SplashServices {
  Future<UserModel?> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) {
    getUserData().then((value) async {
      if (value == null || value.email.isEmpty || value.password.isEmpty) {
        await Future.delayed(const Duration(seconds: 6));
        Navigator.pushNamed(context, RouteName.loginView);
      } else {
        await Future.delayed(const Duration(seconds: 6));
        Navigator.pushNamed(context, RouteName.homeView);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('Error during splash authentication: ${error.toString()}');
      }
    });
  }
}