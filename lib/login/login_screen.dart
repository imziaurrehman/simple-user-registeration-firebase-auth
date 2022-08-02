import 'package:flutter/material.dart';

import 'components/login_body.dart';

class Login_Screen extends StatelessWidget {
  const Login_Screen({Key? key}) : super(key: key);
  static const routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Login_Body(),
    );
  }
}
