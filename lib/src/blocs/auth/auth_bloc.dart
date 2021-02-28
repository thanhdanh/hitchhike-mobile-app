import 'dart:async';

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
        super(AuthenticationInitial());

  final UserRepository _userRepository;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    }

    if (event is UserLoggedIn) {
      yield* _mapUserLoggedInToState(event);
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    yield AuthenticationLoading();

    try {
      await Future.delayed(Duration(milliseconds: 500)); // a simulated delay
      final isSignedIn = await _userRepository.isAuthenticated();

      if (isSignedIn) {
        final currentUser = _userRepository.getUser();
        yield AuthenticationAuthenticated(user: currentUser);
      } else {
        yield AuthenticationNotAuthenticated();
      }
    } catch (e) {
      yield AuthenticationFailure(
          message: e.message ?? 'An unknown error occurred');
    }
  }

  Stream<AuthenticationState> _mapUserLoggedInToState(
      UserLoggedIn event) async* {
    yield AuthenticationAuthenticated(user: event.user);
  }
}
