import 'app_injector.dart' as _i1;
import 'dart:async' as _i2;
import '../modules/network_module.dart' as _i3;
import '../modules/preference_module.dart' as _i4;
import '../../app.dart' as _i5;

class AppInjector$Injector implements _i1.AppInjector {
  AppInjector$Injector._();

  static _i2.Future<_i1.AppInjector> create(
      _i3.NetworkModule _, _i4.PreferenceModule __) async {
    final injector = AppInjector$Injector._();

    return injector;
  }

  @override
  _i5.App get app => null;
}
