import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:user_registeration/login/login_screen.dart';

class Signup_Forms_Fields extends StatefulWidget {
  Signup_Forms_Fields({
    Key? key,
  }) : super(key: key);

  @override
  State<Signup_Forms_Fields> createState() => _Signup_Forms_FieldsState();
}

class _Signup_Forms_FieldsState extends State<Signup_Forms_Fields> {
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();
  final confirm_password_controller = TextEditingController();
  @override
  void dispose() {
    email_controller.dispose();
    password_controller.dispose();
    confirm_password_controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  String? email;
  String? password;
  String? confirm_password;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 66,
      ),
      child: Form(
          key: _formkey,
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              _Email_Forms_Field(),
              SizedBox(
                height: 35,
              ),
              _Password_Forms_Field(),
              SizedBox(
                height: 35,
              ),
              // _Confirm_Password_Forms_Field(),
              SizedBox(
                height: 35,
              ),
              _click_user_Signingup(press: signup, text: "Sign Up"),
            ],
          ))),
    );
  }

  Future signup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email_controller.text.trim(),
        password: password_controller.text.trim());
  }

  TextFormField _Email_Forms_Field() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter Email here",
      ),
      keyboardType: TextInputType.emailAddress,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator: (email) => email != null && EmailValidator.validate(email)
      //     ? "Enter a valid Email"
      //     : null,
      controller: email_controller,
      textInputAction: TextInputAction.next,
    );
  }

  TextFormField _Password_Forms_Field() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter Password here",
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator: (value) =>
      //     value != null && value.length < 4 ? "Enter min, 4 charactors" : null,
      controller: password_controller,
      textInputAction: TextInputAction.done,
    );
  }

  // TextFormField _Confirm_Password_Forms_Field() {
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       hintText: "Enter Confirm Password here",
  //     ),
  //     keyboardType: TextInputType.visiblePassword,
  //     obscureText: true,
  //     autovalidateMode: AutovalidateMode.onUserInteraction,
  //     validator: (value) {
  //       confirm_password = value;
  //       if (confirm_password != value) {
  //         return "entered password is not match,please enter valid password";
  //       } else {
  //         confirm_password != null && confirm_password?.length == 6
  //             ? "password is not match"
  //             : null;
  //       }
  //     },
  //     controller: confirm_password_controller,
  //   );
  // }

  ElevatedButton _click_user_Signingup(
      {required VoidCallback? press, String? text}) {
    return ElevatedButton(
      onPressed: press!,
      child: RichText(text: TextSpan(text: text!)),
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 88, vertical: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          primary: Color.fromARGB(255, 28, 119, 193),
          elevation: 0.0),
    );
  }
}
