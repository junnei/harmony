import 'package:flutter/material.dart';
import 'screen/auth/welcomePage.dart';
import 'screen/auth/loginPage.dart';
import 'screen/auth/registerPage.dart';
import 'screen/profile.dart';
import 'screen/badges.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Connect', initialRoute: WelcomePage.id, routes: {
      WelcomePage.id: (context) => WelcomePage(),
      LoginPage.id: (context) => LoginPage(),
      RegisterPage.id: (context) => RegisterPage(),
      Profile.id: (context) => Profile(),
      Badges.id: (context) => Badges(),
    });
  }
}
