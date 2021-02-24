import 'package:flutter/material.dart';
import 'package:hitchhike/src/ui/login/login_form.dart';

class LoginScreen extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginScreen());
  }

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(title: const Text('Đăng nhập')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LoginForm(),
      ),
    );
  }
}
