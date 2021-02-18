import 'dart:async';

import 'package:hitchhike/constants/app_theme.dart';
import 'package:hitchhike/constants/string.dart';

import 'package:hitchhike/di/components/app_component.dart';
import 'package:hitchhike/stores/theme/theme_store.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:inject/inject.dart';

import 'package:hitchhike/routes.dart';

// global instance for app component
AppComponent appComponent;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) async {
    runApp(appComponent.app);
  });
}

@provide
class MyApp extends StatelessWidget {
  final ThemeStore _themeStore = ThemeStore(appComponent.getRepository());

  @override
  Widget build(BuildContext context) {}
}
