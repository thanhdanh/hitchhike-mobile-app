import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitchhike/src/blocs/login/login_bloc.dart';
import 'package:hitchhike/src/constants/colors.dart';
import 'package:hitchhike/src/data/repositories/user_repository.dart';
import 'package:hitchhike/src/ui/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userRepository = RepositoryProvider.of<UserRepository>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(title: const Text('Đăng nhập')),
      body: BlocProvider(
        create: (context) => LoginBloc(userRepository: userRepository),
        child: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(userRepository: userRepository),
            child: LogInForm(),
          ),
        ),
      ),
    );
  }
}
