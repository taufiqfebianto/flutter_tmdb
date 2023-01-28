import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'preference_event.dart';
part 'preference_state.dart';

class PreferenceBloc extends Bloc<PreferenceEvent, PreferenceState> {
  PreferenceBloc() : super(PreferenceInitial()) {
    on<PreferenceEvent>((event, emit) {
      
    });
  }
}
