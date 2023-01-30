part of 'hometab_bloc.dart';

abstract class HometabEvent extends Equatable {
  const HometabEvent();

  @override
  List<Object> get props => [];
}

class HometabChoose extends HometabEvent {
  const HometabChoose({required this.tab});
  final HometabState tab;

  @override
  String toString() {
    return 'HomeTabChoose : $tab';
  }
}

class DeleteSessionEvent extends HometabEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'DeleteSessionEvent : ';
  }
}
