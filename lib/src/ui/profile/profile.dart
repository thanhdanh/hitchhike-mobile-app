import 'package:flutter/material.dart';
import 'package:hitchhike/src/constants/colors.dart';
import 'package:hitchhike/src/ui/profile/card_header.dart';
import 'package:hitchhike/src/widgets/navbar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.backgroundColor,
      appBar: Navbar(
        title: "Hồ sơ",
        transparent: true,
        bgColor: AppColors.primaryColor,
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: ListView(children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 74.0),
                child: CardHeader(),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
