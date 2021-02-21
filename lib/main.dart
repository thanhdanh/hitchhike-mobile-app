import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitchhike/src/di/injectors/app_injector.dart';
import 'package:hitchhike/src/di/modules/network_module.dart';
import 'package:hitchhike/src/di/modules/preference_module.dart';
import 'src/app.dart';

// global instance for app component
AppInjector appInjector;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  Bloc.observer = SimpleBlocDelegate();

  appInjector = await AppInjector.create(NetworkModule(), PreferenceModule());
  runApp(appInjector.app);
}
