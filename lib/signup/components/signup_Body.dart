import 'package:flutter/material.dart';

import 'signup_forms_fields.dart';

class Signup_Body extends StatelessWidget {
  const Signup_Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Signup_Forms_Fields(),
      ],
    ));
  }
}
