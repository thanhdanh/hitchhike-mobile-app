import 'package:hitchhike/src/data/sharedpref/shared_preference_helper.dart';
import 'package:inject/inject.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Thrown during the sign in with google process if a failure occurs.
class LogInWithGoogleFailure implements Exception {}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}

@provide
class Repository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;
  final GoogleSignIn _googleSignIn;

  Repository(
    this._sharedPrefsHelper,
    GoogleSignIn googleSignIn,
  ) : _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  // Login --------------------------------------------------
  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);
}
