import 'dart:async';
import 'package:hitchhike/data/local/datasources/hitchhike/vehicle_datasource.dart';
import 'package:hitchhike/data/sharedpref/shared_preference_helper.dart';
import 'package:inject/inject.dart';

import 'local/constants/db_constants.dart';

@provide
@singleton
class Repository {
  // data source object
  final HitchhikeDataSource _hitchhikeDataSource;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // COnstructor
  Repository(this._hitchhikeDataSource, this._sharedPrefsHelper);

  // Login: --------------------------------------------------------------------
  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefsHelper.changeBrightnessToDark(value);

  Future<bool> get isDarkMode => _sharedPrefsHelper.isDarkMode;
}
