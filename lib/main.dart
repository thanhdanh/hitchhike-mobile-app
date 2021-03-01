import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitchhike/src/blocs/auth/bloc.dart';
import 'package:hitchhike/src/blocs/simple_bloc_observer.dart';
import 'package:hitchhike/src/data/repositories/user_repository.dart';
import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Bloc.observer = SimpleBlocObserver();
  MyApp.initSystemDefault();

  final UserRepository userRepository = UserRepository();

  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider<UserRepository>(
        create: (context) => userRepository,
      ),
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthenticationBloc(userRepository: userRepository)
                ..add(AppStarted()),
        ),
        // BlocProvider(
        //   create: (context) => LoginBloc(userRepository: userRepository),
        // )
      ],
      child: MyApp(),
    ),
  ));
}
