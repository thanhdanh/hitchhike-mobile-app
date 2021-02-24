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
}
