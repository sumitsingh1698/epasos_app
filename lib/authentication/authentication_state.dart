part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationUnintialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationFailedState extends AuthenticationState {
  final String error;

  AuthenticationFailedState(this.error);

  @override
  List<Object> get props => [error];
}

class GoForLoggedInState extends AuthenticationState {}

class ViewDashboardState extends AuthenticationState {
  final DashboardModel dashboardModel;

  ViewDashboardState(this.dashboardModel);
  @override
  List<Object> get props => [dashboardModel];
}

class ViewHomeState extends AuthenticationState {}

class GoForSignUpState extends AuthenticationState {
  final String type;
  GoForSignUpState(this.type);
  @override
  List<Object> get props => [type];
}

class GoToListOfJobState extends AuthenticationState {
  final String type;
  GoToListOfJobState(this.type);
  @override
  List<Object> get props => [type];
}

class GotoManageSkillState extends AuthenticationState {}

class BacktoHomeState extends AuthenticationState {}
