import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tmdb/models/on_air_series_response_model.dart';
import 'package:flutter_tmdb/models/popular_series_response_model.dart';
import 'package:flutter_tmdb/repository/repos.dart';

part 'series_event.dart';
part 'series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  SeriesRepo seriesRepo = SeriesRepo();
  SeriesBloc() : super(SeriesInitial()) {
    on<SeriesEvent>((event, emit) {});
    on<GetOnAirSeriesEvent>(
      (event, emit) async {
        try {
          OnAirSeriesResponseModel response = await seriesRepo.onAirSeries();
          emit(GetOnAirSeriesSuccessState(response));
        } on DioError catch (e) {
          // ignore: use_rethrow_when_possible
          throw e;
        }
      },
    );
    on<GetPopularSeriesEvent>(
      (event, emit) async {
        try {
          PopularSeriesResponseModel response =
              await seriesRepo.popularSeries();
          emit(GetPopularSeriesSuccessState(response));
        } on DioError catch (e) {
          // ignore: use_rethrow_when_possible
          throw e;
        }
      },
    );
  }
}
