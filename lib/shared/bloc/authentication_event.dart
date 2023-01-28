part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class GetTokenEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'GetTokenEvent';
}

class ValidateTokenEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ValidateTokenEvent';
}

class GetSessionEvent extends AuthenticationEvent {

  @override
  List<Object> get props => [];

  @override
  String toString() => 'GetSessionEvent';
}

class LoggedIn extends AuthenticationEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoggedIn';
}

class LoggedOut extends AuthenticationEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoggedOut';
}
