part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class SingUpLoaing extends AuthState {}
final class SingUpSuccess extends AuthState {}
final class SingUpFailuer extends AuthState {
  final String errMessage;

  SingUpFailuer({required this.errMessage});
}




final class LoginLoading extends AuthState {}
final class LoginSuccess extends AuthState {}
final class LoginFailuer extends AuthState {
  final String errMessage;

  LoginFailuer({required this.errMessage});
}
