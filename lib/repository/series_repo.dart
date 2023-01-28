import 'package:dio/dio.dart';
import 'package:flutter_tmdb/models/on_air_series_response_model.dart';
import 'package:flutter_tmdb/models/popular_series_response_model.dart';

import '../shared/shared.dart';

class SeriesRepo {
  Future<PopularSeriesResponseModel> popularSeries() async {
    try {
      final Map<String, dynamic> parameters = {
        'api_key': Constants.apiKey,
        'page': 1
      };

      Map<String, dynamic> response = await network.getHttp(
          path: Constants.popularTv,
          parameter: parameters,
          contentType: 'application/json');

      return PopularSeriesResponseModel.fromJson(response);
    } on DioError catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }

  Future<OnAirSeriesResponseModel> onAirSeries() async {
    try {
      final Map<String, dynamic> parameters = {
        'api_key': Constants.apiKey,
        'page': 2
      };

      Map<String, dynamic> response = await network.getHttp(
          path: Constants.onAirTv,
          parameter: parameters,
          contentType: 'application/json');

      return OnAirSeriesResponseModel.fromJson(response);
    } on DioError catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}
