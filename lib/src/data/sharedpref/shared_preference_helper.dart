import 'package:hitchhike/src/data/sharedpref/constants/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance
  final Future<SharedPreferences> _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // General Methods: ----------------------------------------------------------
  Future<String> get authToken async {
    return _sharedPreference.then((preference) {
      return preference.getString(Preferences.auth_token);
    });
  }

  Future<void> saveAuthToken(String authToken) async {
    return _sharedPreference.then((preference) {
      preference.setString(Preferences.auth_token, authToken);
    });
  }

  Future<void> removeAuthToken() async {
    return _sharedPreference.then((preference) {
      preference.remove(Preferences.auth_token);
    });
  }
}
