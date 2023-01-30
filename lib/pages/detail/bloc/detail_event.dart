part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class GetVideoEvent extends DetailEvent {
  final String id;

  const GetVideoEvent(this.id);
  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return 'GetVideoEvent : $id';
  }
}