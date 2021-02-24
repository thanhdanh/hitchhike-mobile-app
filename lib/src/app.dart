import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitchhike/src/constants/strings.dart';
import 'package:hitchhike/src/data/repositories/user_repository.dart';
import 'package:hitchhike/src/blocs/auth/bloc.dart';
import 'package:hitchhike/src/ui/home/home.dart';
import 'package:hitchhike/src/ui/splash/splash.dart';

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(
              userRepository: UserRepository(),
            )..add(AppStarted());
          },
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: Strings.appName,
        initialRoute: '/',
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state is Authenticated) {
                return MultiBlocProvider(
                  providers: [],
                  child: HomeScreen(),
                );
              }

              if (state is Unauthenticated) {}
              return Center(child: CircularProgressIndicator());
            },
          );
        },
        onGenerateRoute: (_) => SplashScreen.route(),
      ),
    );
  }
}
