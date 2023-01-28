part of 'preference_bloc.dart';

abstract class PreferenceState extends Equatable {
  const PreferenceState();
  
  @override
  List<Object> get props => [];
}

class PreferenceInitial extends PreferenceState {}
