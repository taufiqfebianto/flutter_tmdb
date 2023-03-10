import 'package:dio/dio.dart';
import 'package:flutter_tmdb/models/movie_video_response_model.dart';

import '../models/models.dart';
import '../models/popular_movie_response_model.dart';
import '../shared/shared.dart';

class MovieRepo {
  Future<PopularMovieResponseModel> popularMovie() async {
    try {
      final Map<String, dynamic> parameters = {
        'api_key': Constants.apiKey,
        'page': 3
      };

      Map<String, dynamic> response = await network.getHttp(
          path: Constants.popularMovie,
          parameter: parameters,
          contentType: 'application/json');

      return PopularMovieResponseModel.fromJson(response);
    } on DioError catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }

  Future<NowPlayingMovieResponseModel> nowPlayingMovie() async {
    try {
      final Map<String, dynamic> parameters = {
        'api_key': Constants.apiKey,
        'page': 4
      };

      Map<String, dynamic> response = await network.getHttp(
          path: Constants.nowPlayingMovie,
          parameter: parameters,
          contentType: 'application/json');

      return NowPlayingMovieResponseModel.fromJson(response);
    } on DioError catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }

  Future<MovieVideoResponseModel> getVideo(String id) async {
    try {
      final Map<String, dynamic> parameters = {
        'api_key': Constants.apiKey,
      };

      Map<String, dynamic> response = await network.getHttp(
          path: '${Constants.getVideoMovie}$id/videos',
          parameter: parameters,
          contentType: 'application/json');

      return MovieVideoResponseModel.fromJson(response);
    } on DioError catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}
