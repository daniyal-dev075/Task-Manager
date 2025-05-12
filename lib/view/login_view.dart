import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/model/user_model.dart';
import 'package:task_manager/res/app_colors.dart';
import 'package:task_manager/res/components/button_container.dart';
import 'package:task_manager/utils/routes/route_name.dart';

import '../res/components/textfield_container.dart';
import '../utils/utils.dart';
import '../view_model/password_view_model.dart';
import '../view_model/user_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    final passwordProvider = Provider.of<PasswordViewModel>(context);
    final userPreferences = Provider.of<UserViewModel>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColours.backgroundColour,
        body: Column(
          children: [
            SizedBox(height: 80.h),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign in Your Account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email Address',
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: TextfieldContainer(
                  focusNode: emailFocus,
                  onFieldSubmitted: (value) {
                    Utils.changeFocus(context, emailFocus, passwordFocus);
                  },
                  controller: emailController,
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.black),
                  hintText: 'Email',
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Password', style: TextStyle(color: Colors.black)),
              ),
            ),
            SizedBox(height: 5.h),
            Consumer<PasswordViewModel>(
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Center(
                    child: TextfieldContainer(
                      focusNode: passwordFocus,
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: passwordProvider.isObscure,
                      prefixIcon: Icon(Icons.lock_open, color: Colors.black),
                      suffixIcon: InkWell(
                        onTap: () {
                          passwordProvider.toggleVisibility();
                        },
                        child:
                            passwordProvider.isObscure
                                ? Icon(
                                  Icons.visibility_off_outlined,
                                  color: Colors.black,
                                )
                                : Icon(
                                  Icons.visibility_outlined,
                                  color: Colors.black,
                                ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            ButtonContainer(
              title: 'Sign In',
              onPress: () async {
                if (emailController.text.toString().isEmpty &&
                    passwordController.text.toString().isEmpty) {
                  Utils.toastMessage('Email and Password are empty');
                  return;
                }

                // Check if email is empty
                if (emailController.text.toString().isEmpty) {
                  Utils.toastMessage('Email is empty');
                  return;
                }

                // Check if password is empty
                if (passwordController.text.toString().isEmpty) {
                  Utils.toastMessage('Password is empty');
                  return;
                }

                // Validate email format
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(emailController.text.toString())) {
                  Utils.toastMessage('Invalid email format');
                  return;
                }

                // Check password length
                if (passwordController.text.toString().length < 6) {
                  Utils.toastMessage('Password must be more than 6 characters');
                  return;
                }

                // If all validations pass, save user and proceed
                await userPreferences.saveUser(
                  UserModel(
                    email: emailController.text.toString(),
                    password: passwordController.text.toString(),
                  ),
                );
                Navigator.pushNamed(context, RouteName.homeView);
                Utils.toastMessage('Signed In Successfully');
              },
            ),
            SizedBox(height: 35.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Or Continue with',
                style: TextStyle(color: Colors.black, fontSize: 16.sp),
              ),
            ),
            SizedBox(height: 35.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Icon(Icons.facebook, size: 32.r, color: Colors.blue),
                  ),
                ),
                SizedBox(width: 15.w),
                Container(
                  height: 50.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Icon(Icons.apple, size: 32.r, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an Account?',
                  style: TextStyle(color: Colors.black, fontSize: 16.sp),
                ),
                SizedBox(width: 2.w),
                Text(
                  'Register',
                  style: TextStyle(
                    color: AppColours.buttonColour,
                    fontSize: 16.sp,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColours.buttonColour,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
