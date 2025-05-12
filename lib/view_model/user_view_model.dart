import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('email', user.email);
    await sp.setString('password', user.password);
    notifyListeners();
    return true;
  }

  // Login user by validating stored credentials
  Future<bool> loginUser(String email, String password) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String? storedEmail = sp.getString('email');
    String? storedPassword = sp.getString('password');

    if (email == storedEmail && password == storedPassword) {
      notifyListeners();
      return true;
    }
    return false;
  }

  // Get stored user (used to display or manage user info locally)
  Future<UserModel?> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? email = sp.getString('email');
    final String? password = sp.getString('password');

    if (email != null && password != null) {
      return UserModel(email: email, password: password);
    }
    return null;
  }

  // Remove user data (logout or clear credentials)
  Future<bool> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove('email');
    await sp.remove('password');
    notifyListeners();
    return true;
  }
}