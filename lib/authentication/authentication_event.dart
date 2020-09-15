part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final User user;

  const LoggedIn({@required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'LoggedIn { user: $user.username.toString() }';
}

class GoForLoggedInEvent extends AuthenticationEvent {}

class GoForSignUpEvent extends AuthenticationEvent {
  final String type;
  GoForSignUpEvent(this.type);

  @override
  List<Object> get props => [type];
}

class ViewDashboardEvent extends AuthenticationEvent {}

class ViewHomeEvent extends AuthenticationEvent {}

class GoForListofJobEvent extends AuthenticationEvent {
  final String type;
  GoForListofJobEvent(this.type);

  @override
  List<Object> get props => [type];
}

class GoToManageEvent extends AuthenticationEvent {}

class BackToHomeEvent extends AuthenticationEvent {}

class LoggedOut extends AuthenticationEvent {}
