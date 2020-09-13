import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jobportal_working/model/user_model.dart';
import 'package:jobportal_working/user_repository/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : super(AuthenticationUnintialized());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      bool hasUser = await userRepository.hasUser();
      if (hasUser) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();

      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.removeUser();
      yield AuthenticationUnauthenticated();
    }
    if (event is GoForLoggedInEvent) {
      yield GoForLoggedInState();
    }
    if (event is GoForSignUpEvent) {
      yield GoForSignUpState(event.type);
    }
    if (event is BackToHomeEvent) {
      yield BacktoHomeState();
    }
  }
}
