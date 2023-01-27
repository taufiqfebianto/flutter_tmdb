import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<MovieEvent>((event, emit) async {});
    on<GetLatestMovieEvent>((event, emit) async {});
    on<GetNowPlayingdMovieEvent>((event, emit) async {});
    on<GetTopratedMovieEvent>((event, emit) async {});
    on<GetUpcomingMovieEvent>((event, emit) async {});
    on<GetPopularMovieEvent>((event, emit) async {});
  }
}
