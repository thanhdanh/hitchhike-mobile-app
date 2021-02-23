import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
    const App({
      Key key,
      @required this.authenticationRepository,
    }) 
  final AuthenticationRepository _authenticationRepository;
}
