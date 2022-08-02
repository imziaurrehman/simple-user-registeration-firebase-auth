import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_registeration/customs/custom.dart';

class Login_Form_Fields extends StatefulWidget {
  Login_Form_Fields({Key? key}) : super(key: key);

  @override
  State<Login_Form_Fields> createState() => _Login_Form_FieldsState();
}

class _Login_Form_FieldsState extends State<Login_Form_Fields> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 88),
      child: Form(
          child: SingleChildScrollView(
        child: Column(
          children: [
            _Email_Form_Field(),
            SizedBox(
              height: 20,
            ),
            _Password_Form_Field(),
            const SizedBox(
              height: 50,
            ),
            _signinbutton(press: signin, text: "Login"),
          ],
        ),
      )),
    );
  }

  Future signin() async {
    // showDialog(
    //     context: context,
    //     builder: (context) => Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //     barrierDismissible: false);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    ;
  }

  TextFormField _Email_Form_Field() {
    return TextFormField(
      decoration: InputDecoration(
        label: Text("Email"),
        hintText: "Enter Email Here",
      ),
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      mouseCursor: MouseCursor.defer,
      textInputAction: TextInputAction.next,
    );
  }

  TextFormField _Password_Form_Field() {
    return TextFormField(
      decoration: InputDecoration(
        label: Text("Password"),
        hintText: "Enter Password Here",
      ),
      controller: _passwordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      textInputAction: TextInputAction.done,
    );
  }

  ElevatedButton _signinbutton({required VoidCallback press, required text}) {
    return ElevatedButton(
      onPressed: press,
      child: Text(
        text,
        textScaleFactor: 1.2,
      ),
      style: ElevatedButton.styleFrom(
          primary: primary_color,
          padding: EdgeInsets.symmetric(horizontal: 86, vertical: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
