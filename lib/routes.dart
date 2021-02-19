import 'package:flutter/material.dart';
import 'package:hitchhike/ui/login/login.dart';
import 'package:hitchhike/ui/splash/splash.dart';

class Routes {
  Routes._();

  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
  };
}
