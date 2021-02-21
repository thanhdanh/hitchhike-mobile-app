import 'package:equatable/equatable.dart';
import 'package:hitchhike/src/constants/enums.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthEvent {
  const AuthenticationStatusChanged(this.status, this.type);

  final AuthenticationStatus status;
  final AuthenticationType type;
  @override
  List<Object> get props => [status, type];
}

class AuthenticationLogoutRequested extends AuthEvent {}
