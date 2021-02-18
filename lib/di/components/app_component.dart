import 'package:hitchhike/data/repository.dart';
import 'package:hitchhike/di/modules/preference_module.dart';
import 'package:inject/inject.dart';
import 'package:hitchhike/main.dart';

import 'app_component.inject.dart' as g;

@Injector(const [PreferenceModule])
abstract class AppComponent {
  @provide
  MyApp get app;

  static Future<AppComponent> create(
    PreferenceModule preferenceModule,
  ) async {
    return await g.AppComponent$Injector.create(
      preferenceModule,
    );
  }

  @provide
  Repository getRepository();
}
