import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hitchhike/src/blocs/auth/auth_event.dart';
import 'package:hitchhike/src/blocs/auth/auth_state.dart';
import 'package:hitchhike/src/constants/enums.dart';
import 'package:hitchhike/src/data/repository.dart';
import 'package:inject/inject.dart';
import 'package:meta/meta.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Repository _repository;

  final GoogleSignIn _googleSignInAccount = GoogleSignIn();
  final FacebookLogin _facebookSignIn = new FacebookLogin();

// StreamSubscription<AuthenticationStatus> _authStatusSubscription;

  @provide
  AuthBloc({
    @required Repository repository,
  })  : assert(_repository != null),
        _repository = repository,
        super(const AuthState.unknown());
  // _authStatusSubscription = _repository.status.listen(
  //   (status) => add(AuthenticationStatusChanged(status)),
  // );

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthenticationStatusChanged) {
      yield await _mapAuthenticationStatusChangedToState(event);
    } else if (event is AuthenticationLogoutRequested) {
      signOut();
      _repository.saveIsLoggedIn(false);
    }
  }

  Future<AuthState> _mapAuthenticationStatusChangedToState(
    AuthenticationStatusChanged event,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return const AuthState.unauthenticated();
      case AuthenticationStatus.authenticated:
        // final user = await _tryGetUser();
        return const AuthState.unauthenticated();
      default:
        return const AuthState.unknown();
    }
  }

  // Facebook login
  Future<bool> signInWithFacebook() async {
    final FacebookLoginResult result =
        await this._facebookSignIn.logInWithReadPermissions(['email']);

    // TODO move to repository
    User loginUser = await this._getFacebookUser(result.accessToken);

    if (result.status == FacebookLoginStatus.loggedIn) {
      await this._checkDatabase(loginUser, LoginMethod.Facebook);
      return true;
    } else if (result.status == FacebookLoginStatus.cancelledByUser) {
      print("Login facebook: cancelado");
      return false;
    } else {
      print("Login facebook ERRO: ${result.errorMessage}");
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
    } on Exception {
      throw LogOutFailure();
    }
  }

  @override
  Future<void> close() {
    // _repository.dispose();
    return super.close();
  }
}
