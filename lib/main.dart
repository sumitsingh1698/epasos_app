import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobportal_working/app.dart';
import 'package:jobportal_working/authentication/authentication_bloc.dart';
import 'package:jobportal_working/bloc_observer/bloc_observer.dart';

import 'user_repository/user_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
  final userRepository = UserRepository();

  runApp(RepositoryProvider<UserRepository>(
    create: (context) => userRepository,
    child: BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(
            userRepository: RepositoryProvider.of<UserRepository>(context))
          ..add(AppStarted());
      },
      child: App(),
    ),
  ));
}
