import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:hitchhike/src/constants/enums.dart';
import 'package:hitchhike/src/data/sharedpref/shared_preference_helper.dart';
import 'package:inject/inject.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Thrown during the sign in with google process if a failure occurs.
class LogInWithGoogleFailure implements Exception {}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}

@provide
class Repository {
  final SharedPreferenceHelper _sharedPrefsHelper;

  @singleton
  final GoogleSignIn _googleSignInAccount = GoogleSignIn.standard();

  @singleton
  final FacebookLogin _facebookSignIn = new FacebookLogin();

  Repository(
    this._sharedPrefsHelper,
  );

  // Login --------------------------------------------------
  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  // Facebook login
  Future<bool> signInWithFacebook() async {
    final FacebookLoginResult result =
        await this._facebookSignIn.logInWithReadPermissions(['email']);

    User loginUser = await this._getFacebookUser(result.accessToken);

    if (result.status == FacebookLoginStatus.loggedIn) {
      await this._checkDatabase(loginUser, AuthenticationType.facebook);
      this.saveIsLoggedIn(true);
      return true;
    } else if (result.status == FacebookLoginStatus.cancelledByUser) {
      print("Login facebook: cancelado");
      this.saveIsLoggedIn(false);
      return false;
    } else {
      print("Login facebook ERROR: ${result.errorMessage}");
      this.saveIsLoggedIn(false);
      return false;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await _googleSignInAccount.signIn();
    } on Exception {
      throw LogInWithGoogleFailure();
    }
  }

  Future<void> signOut() async {
    try {
      await this._googleSignInAccount.signOut();
      await this._facebookSignIn.logOut();
      await this.saveIsLoggedIn(false);
    } on Exception {
      throw LogOutFailure();
    }
  }

  _getFacebookUser(FacebookAccessToken accessToken) async {
    if (accessToken != null) {
      var graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=${accessToken.token}');
      if (graphResponse.statusCode == 200) {
        var body = json.decode(graphResponse.body);
        return new User.fromFacebook(body);
      }
    }
    return null;
  }
}
