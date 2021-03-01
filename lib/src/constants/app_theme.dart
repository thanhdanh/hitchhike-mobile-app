import 'package:flutter/material.dart';
import 'package:hitchhike/src/constants/colors.dart';

final ThemeData themeData = new ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.purple[500],
  backgroundColor: Color(0xFFFBF4EF),
);

final ThemeData themeDataDark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.purple[500],
  backgroundColor: AppColors.backgroundColor,
);
