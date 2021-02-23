import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitchhike/src/blocs/auth/auth_event.dart';
import 'package:hitchhike/src/blocs/auth/auth_state.dart';
import 'package:hitchhike/src/data/repositories/user_repository.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    @required userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository,
        super(Uninitialized());

  final UserRepository _userRepository;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _userRepository.isAuthenticated();
    } catch (_) {
      yield Unauthenticated();
    }
  }
}
