part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();
  
  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class GetVideoSuccessState extends DetailState {
  final MovieVideoResponseModel model;

  const GetVideoSuccessState(this.model);
  @override
  List<Object> get props => [model];

  @override
  String toString() {
    return 'GetVideoSuccessState : ${model.toJson()}';
  }
}