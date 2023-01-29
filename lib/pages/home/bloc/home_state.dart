part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class GetPopularMovieSuccessState extends HomeState {
  final PopularMovieResponseModel model;

  const GetPopularMovieSuccessState(this.model);
  @override
  List<Object> get props => [model];

  @override
  String toString() {
    return 'GetPopularMovieState : ${model.toJson()}';
  }
}

class GetVideoSuccessState extends HomeState {
  final MovieVideoResponseModel model;

  const GetVideoSuccessState(this.model);
  @override
  List<Object> get props => [model];

  @override
  String toString() {
    return 'GetVideoSuccessState : ${model.toJson()}';
  }
}