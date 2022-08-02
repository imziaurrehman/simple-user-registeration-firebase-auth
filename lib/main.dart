import 'package:flutter/material.dart';
import 'package:user_registeration/route.dart';
import 'package:user_registeration/signup/signup_screen.dart';
import 'login/login_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(User_Registeration_Project());
}

// ignore: camel_case_types
class User_Registeration_Project extends StatelessWidget {
  User_Registeration_Project({Key? key}) : super(key: key);
  final navigatorkey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorkey,
      debugShowCheckedModeBanner: false,
      home: MainWidget(),
      routes: route,
    );
  }
}

class MainWidget extends StatelessWidget {
  MainWidget({Key? key}) : super(key: key);
  bool islogin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Something went wrong!"));
          }
          if (snapshot.hasData) {
            return Home_screen();
          } else {
            return islogin ? Signup_Screen() : Login_Screen();
          }
        },
      ),
    );
  }
}

class Home_screen extends StatelessWidget {
  const Home_screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("sign in as :"),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              user.email!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 44,
          ),
          ElevatedButton.icon(
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: Icon(Icons.arrow_back),
            label: Text("Logout"),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 44, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                primary: Color.fromARGB(255, 8, 90, 157)),
          )
        ],
      ),
    );
  }
}
