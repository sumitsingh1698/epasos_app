part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class JobSeekerSignupEvent extends SignupEvent {
  final JobSeekerSignup employeeSignUp;
  JobSeekerSignupEvent(this.employeeSignUp);

  @override
  List<Object> get props => [employeeSignUp];
}

class EmployeeSignupEvent extends SignupEvent {
  final EmployeeSignUp employeeSignUp;
  EmployeeSignupEvent(this.employeeSignUp);

  @override
  List<Object> get props => [employeeSignUp];
}

class GoToHomeEvent extends SignupEvent {}
