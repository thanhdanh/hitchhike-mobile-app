import 'package:flutter/material.dart';
import 'package:hitchhike/widgets/empty_app_bar_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: EmptyAppBar(),
      body: _buildBody(),
    );
  }
}

// body methods:--------------------------------------------------------------
Widget _buildBody() {
  return Material(
    child: Stack(
      children: <Widget>[
        Row(children: <Widget>[]),
      ],
    ),
  );
}
