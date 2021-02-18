import 'dart:async';
import 'package:hitchhike/data/sharedpref/shared_preference_helper.dart';
import 'package:inject/inject.dart';

import 'local/constants/db_constants.dart';

@provide
@singleton
class Repository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  Repository(this._sharedPrefsHelper);

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefsHelper.changeBrightnessToDark(value);

  Future<bool> get isDarkMode => _sharedPrefsHelper.isDarkMode;
}
