import 'package:flutter/widgets.dart';

class PasswordViewModel with ChangeNotifier{
  bool _isObscure = true;
  bool get isObscure => _isObscure;

  void toggleVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }
}