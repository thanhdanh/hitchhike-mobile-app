import 'package:hitchhike/data/repository.dart';
import 'package:inject/inject.dart';
import 'package:hitchhike/main.dart';

import 'app_component.inject.dart' as g;

@Injector()
abstract class AppComponent {
  @provide
  MyApp get app;

  static Future<AppComponent> create() async {
    return await g.AppComponent$Injector.create();
  }

  @provide
  Repository getRepository();
}
