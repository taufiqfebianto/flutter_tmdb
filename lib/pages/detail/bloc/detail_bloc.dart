import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tmdb/repository/movie_repo.dart';

import '../../../models/movie_video_response_model.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  MovieRepo movieRepo = MovieRepo();
  DetailBloc() : super(DetailInitial()) {
    on<DetailEvent>((event, emit) {});
    on<GetVideoEvent>((event, emit) async {
      try {
        MovieVideoResponseModel response = await movieRepo.getVideo(event.id);
        emit(GetVideoSuccessState(response));
      } on DioError catch (e) {
// ignore: use_rethrow_when_possible
        throw e;
      }
    });
  }
}
