part of 'series_bloc.dart';

abstract class SeriesState extends Equatable {
  const SeriesState();
  
  @override
  List<Object> get props => [];
}

class SeriesInitial extends SeriesState {}
