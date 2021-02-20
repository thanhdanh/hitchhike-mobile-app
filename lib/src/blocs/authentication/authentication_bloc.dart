import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {

  final FacebookLogin _facebookSignIn = new FacebookLogin();
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository}) : super(null)

  // Facebook login
  Future<bool> signInWithFacebook() async {
    final FacebookLoginResult result =
        await this._facebookSignIn.logInWithReadPermissions(['email']);

    User loginUser = await this._getFacebookUser(result.accessToken);
    if (result.status == FacebookLoginStatus.loggedIn) {
    } else if (result.status == FacebookLoginStatus.cancelledByUser) {
      print("Login facebook: cancelado");
    }
  }

  // Get facebook user info
  _getFacebookUser(FacebookAccessToken accessToken) async {
    if (accessToken != null) {
      var graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=${accessToken.token}');
    }
  }
}
