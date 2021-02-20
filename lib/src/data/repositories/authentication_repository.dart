import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository {
  final GoogleSignIn _googleSignIn;

  AuthenticationRepository({
    GoogleSignIn googleSignIn,
  }) : _googleSignIn = googleSignIn ?? GoogleSignIn.standard();
}
