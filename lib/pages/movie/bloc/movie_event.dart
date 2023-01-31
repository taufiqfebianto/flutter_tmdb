part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetLatestMovieEvent extends MovieEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'GetLatestMovie : ';
  }
}

class GetPopularMovieEvent extends MovieEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'GetPopularMovieEvent : ';
  }
}

class GetUpcomingMovieEvent extends MovieEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'GetUpcomingMovieEvent : ';
  }
}

class GetTopratedMovieEvent extends MovieEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'GetTopratedMovieEvent : ';
  }
}

class GetNowPlayingMovieEvent extends MovieEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'GetNowPlayingdMovieEvent : ';
  }
}

class GetVideoEvent extends MovieEvent {
  final String id;

  const GetVideoEvent(this.id);
  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return 'GetVideoEvent : $id';
  }
}
