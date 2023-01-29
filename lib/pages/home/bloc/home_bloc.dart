import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tmdb/models/movie_video_response_model.dart';
import 'package:flutter_tmdb/repository/movie_repo.dart';

import '../../../models/popular_movie_response_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  MovieRepo movieRepo = MovieRepo();
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<GetPopularMovieEvent>((event, emit) async {
      try {
        PopularMovieResponseModel response = await movieRepo.popularMovie();
        emit(GetPopularMovieSuccessState(response));
      } on DioError catch (e) {
// ignore: use_rethrow_when_possible
        throw e;
      }
    });
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
