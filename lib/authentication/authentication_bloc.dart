import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jobportal_working/api_connection/api_connection.dart';
import 'package:jobportal_working/home/model/dashboard_model.dart';
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
      yield AuthenticationLoadingState();

      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoadingState();
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
    if (event is GoForListofJobEvent) {
      yield GoToListOfJobState("listofjobs");
    }
    if (event is GoToManageEvent) {
      yield GotoManageSkillState();
    }

    if (event is ViewDashboardEvent) {
      yield AuthenticationLoadingState();
      try {
        final dashboardData =
            await JobPortalApi().getDashboardData(userRepository.user);
        print("in event " + dashboardData.toString());

        DashboardModel dashboardModel = DashboardModel.fromJson(dashboardData);

        yield ViewDashboardState(dashboardModel);
      } catch (e) {
        yield AuthenticationFailedState(e.toString());
      }
    }
    if (event is ViewHomeEvent) {
      yield ViewHomeState();
    }
  }
}
