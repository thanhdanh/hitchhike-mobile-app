import 'package:hitchhike/src/data/sharedpref/constants/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance
  final Future<SharedPreferences> _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  Future<String> get accessToken async {
    return _sharedPreference.then((preference) {
      return preference.getString(Preferences.access_token);
    });
  }

  Future<void> saveAccessToken(String authToken) async {
    return _sharedPreference.then((preference) {
      preference.setString(Preferences.access_token, authToken);
    });
  }

  Future<void> removeAccessToken() async {
    return _sharedPreference.then((preference) {
      preference.remove(Preferences.access_token);
    });
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return _sharedPreference.then((preference) {
      return preference.getBool(Preferences.is_logged_in) ?? false;
    });
  }

  Future<void> saveIsLoggedIn(bool value) async {
    return _sharedPreference.then((preference) {
      preference.setBool(Preferences.is_logged_in, value);
    });
  }
}
