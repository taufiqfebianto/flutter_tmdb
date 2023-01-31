import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tmdb/models/models.dart';
import 'package:flutter_tmdb/repository/repos.dart';

import '../../../models/movie_video_response_model.dart';
import '../../../models/popular_movie_response_model.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieRepo movieRepo = MovieRepo();

  MovieBloc() : super(MovieInitial()) {
    on<MovieEvent>((event, emit) async {});
    on<GetLatestMovieEvent>((event, emit) async {});
    on<GetNowPlayingMovieEvent>((event, emit) async {
      try {
        NowPlayingMovieResponseModel response =
            await movieRepo.nowPlayingMovie();
        emit(GetNowPlayingMovieSuccessState(response));
      } on DioError catch (e) {
// ignore: use_rethrow_when_possible
        throw e;
      }
    });
    on<GetTopratedMovieEvent>((event, emit) async {});
    on<GetUpcomingMovieEvent>((event, emit) async {});
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
