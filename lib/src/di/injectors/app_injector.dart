import 'package:hitchhike/src/app.dart';
import 'package:hitchhike/src/di/modules/preference_module.dart';
import 'package:inject/inject.dart';

import 'app_injector.inject.dart' as g;

@Injector(const [PreferenceModule])
abstract class AppInjector {
  @provide
  App get app;

  static Future<AppInjector> create(
    PreferenceModule preferenceModule,
  ) async {
    return await g.AppInjector$Injector.create(
      preferenceModule,
    );
  }
}
