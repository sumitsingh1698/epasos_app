part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationUnintialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class GoForLoggedInState extends AuthenticationState {}

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
