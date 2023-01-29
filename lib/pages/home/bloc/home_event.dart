part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetPopularMovieEvent extends HomeEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'GetPopularMovieEvent : ';
  }
}

class GetVideoEvent extends HomeEvent {
  final String id;

  const GetVideoEvent(this.id);
  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return 'GetVideoEvent : $id';
  }
}
