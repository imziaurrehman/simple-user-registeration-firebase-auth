import 'package:flutter/material.dart';

import 'components/signup_Body.dart';

class Signup_Screen extends StatelessWidget {
  const Signup_Screen({Key? key}) : super(key: key);
  static const routeName = "/signup";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Screen"),
        backgroundColor: Colors.white30,
        toolbarHeight: 80.0,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Signup_Body(),
    );
  }
}
