part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class GetLatestMovieSuccessState extends MovieState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'GetLatestMovie : ';
  }
}

class GetPopularMovieSuccessState extends MovieState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'GetPopularMovieState : ';
  }
}

class GetUpcomingMovieSuccessState extends MovieState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'GetUpcomingMovieState : ';
  }
}

class GetTopratedMovieSuccessState extends MovieState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'GetTopratedMovieState : ';
  }
}

class GetNowPlayingdMovieSuccessState extends MovieState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'GetNowPlayingdMovieState : ';
  }
}

class FailedState extends MovieState {}
