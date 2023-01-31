import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_tmdb/models/models.dart';
import 'package:flutter_tmdb/models/movie_video_response_model.dart';
import 'package:flutter_tmdb/widgets/widgets.dart';

import '../../models/popular_movie_response_model.dart';
import '../../shared/shared.dart';
import '../../styles/styles.dart';
import 'bloc/movie.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  MovieBloc? bloc;

  MovieVideoResponseModel videoModel = MovieVideoResponseModel();
  // List<String> videoId = [];
  String videoId = '';
  int currentIndex = 0;
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

  _getVideo() async {
    bloc!.add(GetVideoEvent(popularModel.results![currentIndex].id.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
      listener: ((context, state) {
        if (state is GetPopularMovieSuccessState) {
          popularModel = state.model;
          bloc!.add(GetNowPlayingMovieEvent());
        }
        if (state is GetNowPlayingMovieSuccessState) {
          nowPlayingModel = state.model;
        }
        if (state is GetVideoSuccessState) {
          // videoModel = state.model;
          videoId = state.model.results![0].key!;
          // debugPrint(videoId);
          Navigator.of(context).pushNamed(Routers.detail,
              arguments: [popularModel, videoId, currentIndex]);

          // videoId.clear();
          // for (var a = 0; a < videoModel.results!.length; a++) {
          //   videoId.add(videoModel.results![a].key!);
          // }
        }
        if (state is GetLatestMovieSuccessState) {}
        if (state is GetUpcomingMovieSuccessState) {}
        if (state is GetTopratedMovieSuccessState) {}
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
                      return popularModel.results?[index].backdropPath != null
                          ? Stack(
                              children: [
                                Image.network(
                                  '${Constants.baseImagePath}${popularModel.results?[index].backdropPath}',
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Text(
                                    popularModel.results![index].title!,
                                    style: styleText.lato(
                                        color: colorStyle.white(),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                          : loadingWidget();
                    },
                    itemCount: 6,
                    autoplay: true,
                  ),
                ),
                titleButton(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(Routers.more, arguments: popularModel);
                    },
                    title: 'Popular'),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: ((context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                          _getVideo();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: popularModel.results?[index].posterPath !=
                                    null
                                ? Image.network(
                                    '${Constants.baseImagePath}${popularModel.results?[index].posterPath}',
                                    fit: BoxFit.cover)
                                : loadingWidget(),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                titleButton(onTap: () {}, title: 'Now Playing'),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: ((context, int index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: nowPlayingModel.results?[index].posterPath !=
                                    null
                                ? Image.network(
                                    '${Constants.baseImagePath}${nowPlayingModel.results?[index].posterPath}',
                                    fit: BoxFit.cover)
                                : loadingWidget(),
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
