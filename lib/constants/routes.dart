import 'package:flutter/material.dart';
import 'package:connect/ui/ui.dart';
import 'package:connect/ui/auth/auth.dart';

import 'package:connect/screen/auth/welcomePage.dart';
import 'package:connect/screen/auth/LoginPage.dart';
import 'package:connect/screen/auth/registerPage.dart';
import 'package:connect/screen/profile.dart';
import 'package:connect/screen/badges.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiating this object
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String settings = '/settings';
  static const String resetPassword = '/reset-password';
  static const String updateProfile = '/update-profile';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String profile = '/profile';
  static const String badges = '/badges';

  static final routes = <String, WidgetBuilder>{
    signin: (BuildContext context) => SignInUI(),
    signup: (BuildContext context) => SignUpUI(),
    settings: (BuildContext context) => SettingsUI(),
    resetPassword: (BuildContext context) => ResetPasswordUI(),
    updateProfile: (BuildContext context) => UpdateProfileUI(),

    welcome: (context) => WelcomePage(),
    login: (context) => LoginPage(),
    register: (context) => RegisterPage(),
    profile: (context) => Profile(),
    badges: (context) => Badges(),
  };
}
