import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jobportal_working/authentication/authentication_bloc.dart';
import 'package:jobportal_working/login/bloc/login_bloc.dart';
import 'package:jobportal_working/login/login.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        BlocProvider.of<AuthenticationBloc>(context).add(BackToHomeEvent());
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Sign In         ")),
        ),
        body: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              userRepository: RepositoryProvider.of<UserRepository>(context),
            );
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}
