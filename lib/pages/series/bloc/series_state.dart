part of 'series_bloc.dart';

abstract class SeriesState extends Equatable {
  const SeriesState();

  @override
  List<Object> get props => [];
}

class SeriesInitial extends SeriesState {}

class GetPopularSeriesSuccessState extends SeriesState {
  final PopularSeriesResponseModel model;
  const GetPopularSeriesSuccessState(this.model);
  @override
  List<Object> get props => [model];
  @override
  String toString() {
    return 'GetPopularSeriesSuccessState : ${model.toJson()}';
  }
}

class GetOnAirSeriesSuccessState extends SeriesState {
  final OnAirSeriesResponseModel model;
  const GetOnAirSeriesSuccessState(this.model);
  @override
  List<Object> get props => [model];
  @override
  String toString() {
    return 'GetOnAirSeriesSuccessState : ${model.toJson()}';
  }
}
