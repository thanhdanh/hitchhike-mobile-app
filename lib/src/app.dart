import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitchhike/src/constants/strings.dart';
import 'package:hitchhike/src/data/repositories/user_repository.dart';
import 'package:hitchhike/src/blocs/auth/bloc.dart';
import 'package:hitchhike/src/ui/home/home.dart';
import 'package:hitchhike/src/ui/login/login.dart';
import 'package:hitchhike/src/ui/splash/splash.dart';

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<UserRepository>(
            create: (context) {
              return UserRepository();
            },
          ),
          // RepositoryProvider<HitchhikeRepository>(
          //   create: (context) {
          //     return HitchhikeRepository();
          //   },
          // ),
        ],
        child: BlocProvider<AuthenticationBloc>(
          create: (context) {
            final userRepository =
                RepositoryProvider.of<UserRepository>(context);
            return AuthenticationBloc(userRepository: userRepository)
              ..add(AppStarted());
          },
          child: AppView(),
        ));
  }
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }

          if (state is Authenticated) {
            return HomeScreen();
          }

          if (state is Unauthenticated) {
            return LoginScreen();
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
