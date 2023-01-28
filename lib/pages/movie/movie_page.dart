import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_tmdb/models/models.dart';
import 'package:flutter_tmdb/styles/colors.dart';
import 'package:flutter_tmdb/widgets/widgets.dart';

import '../../models/popular_movie_response_model.dart';
import '../../shared/shared.dart';
import 'bloc/movie.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  MovieBloc? bloc;
  late PopularMovieResponseModel popularModel = PopularMovieResponseModel();
  late NowPlayingMovieResponseModel nowPlayingModel =
      NowPlayingMovieResponseModel();

  SwiperController? swiperController;

  @override
  void initState() {
    bloc = BlocProvider.of<MovieBloc>(context);
    super.initState();
    bloc!.add(GetPopularMovieEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  _nowPlayingMovie() async {
    bloc!.add(GetNowPlayingMovieEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
      listener: ((context, state) {
        if (state is GetLatestMovieSuccessState) {}
        if (state is GetPopularMovieSuccessState) {
          popularModel = state.model;
          bloc!.add(GetNowPlayingMovieEvent());
          // _nowPlayingMovie();
        }
        if (state is GetUpcomingMovieSuccessState) {}
        if (state is GetTopratedMovieSuccessState) {}
        if (state is GetNowPlayingMovieSuccessState) {
          nowPlayingModel = state.model;
        }
      }),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorStyle.black(),
          body: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: ListView(
              children: [
                SizedBox(
                  height: 200,
                  child: Swiper(
                    controller: swiperController,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        '${Constants.baseImagePath}${popularModel.results?[index].backdropPath}',
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: 6,
                    autoplay: true,
                  ),
                ),
                titleButton(onTap: () {}, title: 'Popular'),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: popularModel.results?.length,
                    itemBuilder: ((context, int index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                                '${Constants.baseImagePath}${popularModel.results?[index].posterPath}',
                                fit: BoxFit.cover),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                titleButton(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routers.more);
                    },
                    title: 'Now Playing'),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: nowPlayingModel.results?.length,
                    itemBuilder: ((context, int index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                                '${Constants.baseImagePath}${nowPlayingModel.results?[index].posterPath}',
                                fit: BoxFit.cover),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
