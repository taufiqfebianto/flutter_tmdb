import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tmdb/models/movie_video_response_model.dart';
import 'package:flutter_tmdb/models/popular_movie_response_model.dart';
import 'package:flutter_tmdb/shared/shared.dart';
import 'package:flutter_tmdb/styles/colors.dart';
import 'package:flutter_tmdb/styles/fonts.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../widgets/widgets.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  HomeBloc? bloc = HomeBloc();
  String? id;
  String videoIds = '';
  List<String>? videoId = [''];

  PopularMovieResponseModel model = PopularMovieResponseModel();
  MovieVideoResponseModel videoModel = MovieVideoResponseModel();

  late YoutubePlayerController _bottomVideoController;

  final bool _isPlayerReady = false;

  final YoutubePlayerController _topVideoController = YoutubePlayerController(
      initialVideoId: 'g4U4BQW9OEk',
      flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: true,
          loop: true,
          hideControls: true,
          hideThumbnail: true,
          controlsVisibleAtStart: false,
          enableCaption: false));

  @override
  void initState() {
    super.initState();
    _bottomVideoController = YoutubePlayerController(
      initialVideoId: videoIds,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);

    bloc = BlocProvider.of<HomeBloc>(context);
    bloc!.add(GetPopularMovieEvent());
  }

  void listener() {
    if (_isPlayerReady && mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: styleText.lato(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        backgroundColor: colorStyle.darkBlue().withOpacity(0.5),
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  _showPreview(int index) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: colorStyle.transparent(),
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 0.7),
                colors: <Color>[
                  colorStyle.transparent(),
                  colorStyle.darkBlue(),
                ],
              ),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: YoutubePlayer(
                    controller: _bottomVideoController,
                    showVideoProgressIndicator: true,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text(
                          model.results![index].title!,
                          style: styleText.lato(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.date_range_rounded,
                                  color: colorStyle.white(),
                                ),
                                Text(
                                  ' ${DateFormat('yyyy').format(model.results![index].releaseDate!)}',
                                  style: styleText.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.remove_red_eye_rounded,
                                  color: colorStyle.white(),
                                ),
                                Text(
                                  ' ${model.results?[index].popularity}',
                                  style: styleText.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.thumb_up_alt_rounded,
                                  color: colorStyle.white(),
                                ),
                                Text(
                                  ' ${model.results?[index].voteCount}',
                                  style: styleText.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                _showSnackBar('Added to watchlist');
                              },
                              icon: Icon(
                                Icons.add_rounded,
                                color: colorStyle.lightBlue(),
                              ),
                            ),
                            Text(
                              'Watchlist',
                              style: styleText.lato(
                                color: colorStyle.lightBlue(),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_arrow_rounded,
                                color: colorStyle.lightBlue(),
                              ),
                            ),
                            Text(
                              'Watch Now',
                              style: styleText.lato(
                                color: colorStyle.lightBlue(),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  currentIndex = index;
                                });
                                Navigator.of(context).pushNamed(Routers.detail,
                                    arguments: [model, videoIds, currentIndex]);
                              },
                              icon: Icon(
                                Icons.info_rounded,
                                color: colorStyle.lightBlue(),
                              ),
                            ),
                            Text(
                              'Info',
                              style: styleText.lato(
                                color: colorStyle.lightBlue(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: ((context, state) {
        if (state is GetPopularMovieSuccessState) {
          model = state.model;
        }
        if (state is GetVideoSuccessState) {
          videoIds = state.model.results![0].key!;
          _showPreview(currentIndex);
        }
      }),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorStyle.black(),
          body: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: YoutubePlayer(
                    controller: _topVideoController,
                    showVideoProgressIndicator: true,
                  ),
                ),
                Container(
                  height: 80,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      squareGradientButton(
                          icon: Icons.movie_rounded, text: 'Box Office'),
                      squareGradientButton(
                          icon: Icons.tv_rounded, text: 'Series'),
                      squareGradientButton(
                          icon: Icons.people_rounded, text: 'Family'),
                      squareGradientButton(
                          icon: Icons.auto_awesome_rounded, text: 'Fantasy'),
                      squareGradientButton(
                          icon: Icons.local_police, text: 'Crime'),
                      squareGradientButton(
                          icon: Icons.spatial_tracking_outlined, text: 'Drama'),
                      squareGradientButton(
                          icon: Icons.face_rounded, text: 'Kids'),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 12,
                    itemBuilder: ((context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                          bloc!.add(GetVideoEvent(
                              model.results![index].id!.toString()));
                        },
                        child: model.results?[index].backdropPath != null
                            ? Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    height: 300,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                          '${Constants.baseImagePath}${model.results?[index].backdropPath}',
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        gradient: LinearGradient(
                                          begin:
                                              const FractionalOffset(0.0, 0.0),
                                          end:
                                              const FractionalOffset(0.0, 0.85),
                                          colors: <Color>[
                                            Colors.transparent,
                                            colorStyle.black()
                                          ],
                                        ),
                                      ),
                                      margin: const EdgeInsets.only(bottom: 10),
                                      height: 300,
                                      width: 375,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              model.results![index].title!,
                                              style: styleText.lato(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              model.results![index].overview!,
                                              textAlign: TextAlign.justify,
                                              maxLines: 3,
                                              style: styleText.lato(),
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : loadingWidget(),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
