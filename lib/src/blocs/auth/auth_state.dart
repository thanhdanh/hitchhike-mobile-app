import 'package:equatable/equatable.dart';
import 'package:hitchhike/src/constants/enums.dart';

class AuthState extends Equatable {
  const AuthState._({
    status: AuthenticationStatus.unknown,
    type: AuthenticationType.unknown,
  });

  const AuthState.unknown() : this._();
  const AuthState.authenticated(AuthenticationType type)
      : this._(status: AuthenticationStatus.authenticated, type: type);

  const AuthState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status = AuthenticationStatus.unknown;
  final AuthenticationType type = AuthenticationType.unknown;

  @override
  List<Object> get props => [status, type];
}
