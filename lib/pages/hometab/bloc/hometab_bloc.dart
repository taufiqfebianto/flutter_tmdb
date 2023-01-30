import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tmdb/repository/user_repo.dart';

part 'hometab_event.dart';
part 'hometab_state.dart';

class HometabBloc extends Bloc<HometabEvent, HometabState> {
  UserRepo userRepo = UserRepo();
  HometabBloc() : super(HometabState.tmdb) {
    on<HometabEvent>((event, emit) {});
    on<HometabChoose>((event, emit) {
      emit(event.tab);
    });
    on<DeleteSessionEvent>((event, emit) async {
      try {
        await userRepo.deleteSession();
        exit(0);
      } on DioError catch (e) {
        // ignore: use_rethrow_when_possible
        throw e;
      }
    });
  }
}
