import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:user_registeration/customs/custom.dart';
import 'package:user_registeration/signup/signup_screen.dart';
import 'login_form_field.dart';

class Login_Body extends StatelessWidget {
  Login_Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _crossbutton(),
              _logintext(),
              const SizedBox(
                height: 20,
              ),
              Login_Form_Fields(),

              const SizedBox(
                height: 40,
              ),
              //facebookbutton
              _dotted_border_buttons(
                  press: () {},
                  text: "Facebook",
                  onPrimary: const Color.fromARGB(255, 22, 117, 194),
                  dotted_border_color: const Color.fromARGB(255, 22, 117, 194)),
              const SizedBox(
                height: 15,
              ),
              //googlebotton
              _dotted_border_buttons(
                  press: () {},
                  text: "Google",
                  onPrimary: const Color.fromARGB(255, 220, 42, 30),
                  dotted_border_color: Color.fromARGB(255, 220, 42, 30)),
              const SizedBox(
                height: 20,
              ),
              //forgot screen
              _textbuttons(press: () {}, text: "Forgot Password?"),
              const SizedBox(
                height: 45,
              ),
              // signupbutton
              _signupbutton(
                  press: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Signup_Screen()))),
            ],
          ),
        ),
      ),
    );
  }

  TextButton _textbuttons({required VoidCallback press, required text}) {
    return TextButton(
      onPressed: press,
      child: Text(
        text,
        textScaleFactor: 1.1,
      ),
      style: TextButton.styleFrom(
        primary: Colors.grey,
        shadowColor: Colors.amber,
        elevation: 0,
        // backgroundColor: Color.fromARGB(255, 199, 181, 20),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Row _signupbutton({required VoidCallback press}) {
    return Row(
      children: [
        Text("if user is not logged in please\t"),
        TextButton(
            onPressed: press,
            child: Text("Signin?",
                style: TextStyle(
                  color: Color.fromARGB(255, 205, 53, 42),
                )))
      ],
    );
  }

  DottedBorder _dotted_border_buttons(
      {required VoidCallback press,
      required text,
      required Color onPrimary,
      required Color dotted_border_color}) {
    return DottedBorder(
      child: ElevatedButton(
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
            onPrimary: onPrimary,
            primary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
      ),
      borderType: BorderType.RRect,
      color: dotted_border_color,
      radius: Radius.circular(30),
      strokeWidth: 6,
    );
  }

  Container _crossbutton() {
    return Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(right: 20, top: 20),
      child: Image.asset("assets/imgs/cross.png", width: 25),
    );
  }

  Container _logintext() {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 80),
      child: Text(
        "Login",
        textScaleFactor: 1.5,
        style: heading,
      ),
    );
  }
}
