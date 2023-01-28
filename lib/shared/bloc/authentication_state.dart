part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  const AuthenticationAuthenticated();
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AuthenticationAuthenticated';
}

class AuthenticationUnauthenticated extends AuthenticationState {
  const AuthenticationUnauthenticated();
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AuthenticationUnauthenticated';
}

class GetTokenSuccessState extends AuthenticationState {
  final RequestTokenResponseModel model;

  const GetTokenSuccessState(this.model);

  @override
  List<Object> get props => [model];

  @override
  String toString() => 'GetTokenSuccessState : ${model.toJson()}';
}

class ValidateTokenSuccessState extends AuthenticationState {
  const ValidateTokenSuccessState();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ValidateTokenSuccessState : ';
}

class GetSessionSuccessState extends AuthenticationState {
  final ValidateTokenResponseModel model;
  const GetSessionSuccessState(this.model);

  @override
  List<Object> get props => [model];

  @override
  String toString() => 'GetSessionSuccessState : ${model.toJson()}';
}

class FailedState extends AuthenticationState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'FailedState';
}
