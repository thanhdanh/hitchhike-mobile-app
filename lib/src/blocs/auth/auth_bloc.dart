import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitchhike/src/blocs/auth/auth_event.dart';
import 'package:hitchhike/src/blocs/auth/auth_state.dart';
import 'package:hitchhike/src/constants/enums.dart';
import 'package:hitchhike/src/data/repository.dart';
import 'package:inject/inject.dart';
import 'package:meta/meta.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Repository _repository;

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
      _repository.signOut();
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

  @override
  Future<void> close() {
    // _repository.dispose();
    return super.close();
  }
}
