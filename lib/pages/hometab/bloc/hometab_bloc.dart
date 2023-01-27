import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hometab_event.dart';
part 'hometab_state.dart';

class HometabBloc extends Bloc<HometabEvent, HometabState> {
  HometabBloc() : super(HometabState.tmdb) {
    on<HometabEvent>((event, emit) {});
    on<HometabChoose>((event, emit) {
      emit(event.tab);
    });
  }
}
