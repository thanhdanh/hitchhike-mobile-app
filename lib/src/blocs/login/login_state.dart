import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class LoginState extends Equatable {
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  LoginState({
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
  });

  @override
  List<Object> get props => [];

  factory LoginState.empty() {
    return LoginState(
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory LoginState.success() {
    return LoginState(
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  factory LoginState.failure() {
    return LoginState(
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }
}
