import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jobportal_working/authentication/authentication_bloc.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      bool isEmailCorrect = event.email.contains("@");
      bool isPassCorrect = event.pass.length >= 4;

      if (isEmailCorrect == false || isPassCorrect == false) {
        yield LoginFaliure(error: "Give Correct email and Password".toString());
      } else {
        try {
          final user = await userRepository.authenticate(
            email: event.email,
            pass: event.pass,
          );

          authenticationBloc.add(LoggedIn(user: user));
        } catch (error) {
          yield LoginFaliure(error: error.toString());
        }
      }
    }
  }
}
