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
  final PopularMovieResponseModel model;

  const GetPopularMovieSuccessState(this.model);
  @override
  List<Object> get props => [model];

  @override
  String toString() {
    return 'GetPopularMovieState : ${model.toJson()}';
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

class GetNowPlayingMovieSuccessState extends MovieState {
  final NowPlayingMovieResponseModel model;
  const GetNowPlayingMovieSuccessState(this.model);
  @override
  List<Object> get props => [model];

  @override
  String toString() {
    return 'GetNowPlayingdMovieState : ${model.toJson()}';
  }
}

class FailedState extends MovieState {}
