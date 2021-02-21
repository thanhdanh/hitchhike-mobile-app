import 'package:flutter/material.dart';
import 'package:hitchhike/src/ui/home/home.dart';
import 'package:hitchhike/src/ui/login/login.dart';
import 'package:hitchhike/src/ui/splash/splash.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String profile = '/profile';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    home: (BuildContext context) => HomeScreen(),
    login: (BuildContext context) => LoginScreen(),
  };
}
