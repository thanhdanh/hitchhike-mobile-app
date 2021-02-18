import 'dart:async';
import 'package:hitchhike/data/sharedpref/shared_preference_helper.dart';
import 'package:inject/inject.dart';

@provide
@singleton
class Repository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  Repository(this._sharedPrefsHelper);

  Future<bool> get isDarkMode => _sharedPrefsHelper.isDarkMode;
}
