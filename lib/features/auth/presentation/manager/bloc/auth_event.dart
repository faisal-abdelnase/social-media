part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SingUpEvent extends AuthEvent{
  final String email;
  final String passowrd;

  SingUpEvent({required this.email, required this.passowrd});

}


class LoginEvent extends AuthEvent{
  final String email;
  final String passowrd;

  LoginEvent({required this.email, required this.passowrd});
}

class AddUser extends AuthEvent{

  final UserModel user;

  AddUser({required this.user});
}
