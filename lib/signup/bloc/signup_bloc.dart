import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobportal_working/authentication/authentication_bloc.dart';
import 'package:jobportal_working/signup/model/employee_signup.dart';
import 'package:jobportal_working/signup/model/jobseeker_signup.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  UserRepository userRepository;
  AuthenticationBloc authenticationBloc;

  SignupBloc({this.authenticationBloc, this.userRepository})
      : super(SignupInitial());

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is JobSeekerSignupEvent) {
      yield SignupLoadingState();

      try {
        print("here");
        await userRepository.signUpJobSeeker(event.employeeSignUp);
        authenticationBloc.add(LoggedIn(user: userRepository.user));
      } catch (e) {
        print(e);
        yield SignupFailed("$e");
      }
    }
    if (event is EmployeeSignupEvent) {
      yield* _employeeSignUpMapEventToState(event);
    }
  }

  // Employee Sign Up Event
  Stream<SignupState> _employeeSignUpMapEventToState(
    EmployeeSignupEvent event,
  ) async* {
    yield SignupLoadingState();

    try {
      print("employer here");
      await userRepository.signUpEmployee(event.employeeSignUp);
      authenticationBloc.add(LoggedIn(user: userRepository.user));
    } catch (e) {
      print(e);
      yield SignupFailed("$e");
    }
  }
}
