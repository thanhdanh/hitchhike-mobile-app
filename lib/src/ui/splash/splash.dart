import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/img_login.png',
          key: const Key('splash_image'),
          width: 150,
        ),
      ),
    );
  }
}
