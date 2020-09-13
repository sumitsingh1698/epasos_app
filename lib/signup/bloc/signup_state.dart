part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupLoadingState extends SignupState {}

class GoToHomeState extends SignupState {}

class SignupFailed extends SignupState {
  final String error;
  SignupFailed(this.error);

  @override
  List<Object> get props => [error];
}
