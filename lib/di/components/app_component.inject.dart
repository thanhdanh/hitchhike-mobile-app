import 'app_component.dart' as _i1;
import '../modules/preference_module.dart' as _i2;
import '../../data/sharedpref/shared_preference_helper.dart' as _i3;
import '../../data/repository.dart' as _i4;
import 'dart:async' as _i5;
import '../../main.dart' as _i6;

class AppComponent$Injector implements _i1.AppComponent {
  AppComponent$Injector._(this._preferenceModule);

  final _i2.PreferenceModule _preferenceModule;

  _i3.SharedPreferenceHelper _singletonSharedPreferenceHelper;

  _i4.Repository _singletonRepository;

  static _i5.Future<_i1.AppComponent> create(
      _i2.PreferenceModule preferenceModule) async {
    final injector = AppComponent$Injector._(preferenceModule);

    return injector;
  }

  _i6.MyApp _createMyApp() => _i6.MyApp();
  _i4.Repository _createRepository() =>
      _singletonRepository ??= _i4.Repository(_createSharedPreferenceHelper());
  _i3.SharedPreferenceHelper _createSharedPreferenceHelper() =>
      _singletonSharedPreferenceHelper ??=
          _preferenceModule.provideSharedPreferenceHelper();
  @override
  _i6.MyApp get app => _createMyApp();
  @override
  _i4.Repository getRepository() => _createRepository();
}
