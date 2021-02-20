import 'package:flutter/material.dart';
import 'package:hitchhike/src/constants/strings.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: Strings.appName,
    );
  }
}
