import 'package:another_flushbar/flushbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/res/app_colors.dart';

class Utils {

  static String getPreviewText(String details) {
    final words = details.trim().split(RegExp(r'\s+'));
    if (words.length <= 3) {
      return words.join(' ');
    } else {
      return '${words.take(3).join(' ')}...';
    }
  }
  static changeFocus(BuildContext context,FocusNode current,FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
  static toastMessage(String message){
    Fluttertoast.showToast(
        backgroundColor: AppColours.lightGreenContainer,
        textColor: Colors.white,
        msg: message);
  }
  static flushbarMessage(BuildContext context, String message) {
    Flushbar(
      message: message,
      backgroundColor: AppColours.lightGreenContainer,
      duration: const Duration(seconds: 2), // optional but recommended
    ).show(context);
  }
}