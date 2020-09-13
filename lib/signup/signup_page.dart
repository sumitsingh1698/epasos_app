import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jobportal_working/authentication/authentication_bloc.dart';
import 'package:jobportal_working/signup/bloc/signup_bloc.dart';
import 'package:jobportal_working/signup/employee_signup_form.dart';
import 'package:jobportal_working/signup/jobseeker_signup_form.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';

class EmployeeSignUpPage extends StatelessWidget {
  final String signupType;
  EmployeeSignUpPage(this.signupType, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        BlocProvider.of<AuthenticationBloc>(context).add(BackToHomeEvent());
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Sign Up")),
        ),
        body: BlocProvider(
          create: (context) {
            return SignupBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              userRepository: RepositoryProvider.of<UserRepository>(context),
            );
          },
          child: signupType == "employee"
              ? SignUpEmployeeForm()
              : SignUpJobSeekerForm(),
        ),
      ),
    );
  }
}
