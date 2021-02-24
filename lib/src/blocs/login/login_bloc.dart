import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitchhike/src/blocs/login/bloc.dart';
import 'package:hitchhike/src/data/repositories/user_repository.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;

  LoginBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository,
        super(LoginState.empty());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginWithGooglePressed) {
      yield* _mapLoginWithGooglePressedToState();
    }
  }

  Stream<LoginState> _mapLoginWithGooglePressedToState() async* {
    try {
      await _userRepository.logInWithGoogle();
      yield LoginState.success();
    } catch (_) {
      print(_.toString());
      yield LoginState.failure();
    }
  }
}
