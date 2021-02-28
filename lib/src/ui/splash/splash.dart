import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SizedBox(
            width: 240,
            child: Image.asset(
              'assets/images/logo.png',
              key: const Key('splash_image'),
              width: 150,
            ),
          ),
        ),
      ),
    );
  }
}
