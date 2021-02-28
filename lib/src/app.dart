import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitchhike/src/constants/app_theme.dart';
import 'package:hitchhike/src/constants/strings.dart';
import 'package:hitchhike/src/blocs/auth/bloc.dart';
import 'package:hitchhike/src/router.dart';
import 'package:hitchhike/src/ui/home/home.dart';
import 'package:hitchhike/src/ui/login/login.dart';
import 'package:hitchhike/src/ui/splash/splash.dart';

class MyApp extends StatelessWidget {
  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      // initialRoute: AppRouter.SPLASH,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          } else if (state is AuthenticationAuthenticated) {
            return HomeScreen();
          } else if (state is AuthenticationNotAuthenticated) {
            return LoginScreen();
          }

          return Container(
            child: Center(child: Text('Unhandle State $state')),
          );
        },
      ),
    );
  }
}
