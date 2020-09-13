part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String pass;

  const LoginButtonPressed({@required this.email, @required this.pass});

  @override
  List<Object> get props => [email, pass];

  @override
  String toString() =>
      'LoginButtonPressed { username: $email, password: $pass }';
}
