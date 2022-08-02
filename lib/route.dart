import 'package:flutter/material.dart';
import 'package:user_registeration/login/login_screen.dart';
import 'package:user_registeration/signup/signup_screen.dart';
import "./login/login_screen.dart";

final Map<String, Widget Function(BuildContext)> route = {
  Login_Screen.routeName: (context) => const Login_Screen(),
  Signup_Screen.routeName: (context) => const Signup_Screen(),
};
