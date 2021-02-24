import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitchhike/src/blocs/login/bloc.dart';
import 'package:hitchhike/src/data/repositories/user_repository.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;

  LoginBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;
}
