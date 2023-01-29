import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
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
  String videoId = 'twDOIy2kETw';

  PopularMovieResponseModel model = PopularMovieResponseModel();

  final YoutubePlayerController _controller =
      YoutubePlayerController(initialVideoId: 'g4U4BQW9OEk');

  final YoutubePlayerController _controller2 =
      YoutubePlayerController(initialVideoId: 'twDOIy2kETw');

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<HomeBloc>(context);
    bloc!.add(GetPopularMovieEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  _showPriview(int index, int id) {
    bloc!.add(GetVideoEvent(id.toString()));
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: colorStyle.transparent(),
        builder: (BuildContext builder) {
          return Container(
            // padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
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
                  child:
                      // Image.network(
                      //   '${Constants.baseImagePath}${model.results?[index].backdropPath}',
                      //   fit: BoxFit.fill,
                      // ),
                      YoutubePlayer(
                    controller: _controller2,
                    showVideoProgressIndicator: true,
                    // videoProgressIndicatorColor: Colors.amber,
                    // progressColors: ProgressColors(
                    //     playedColor: Colors.amber,
                    //     handleColor: Colors.amberAccent,
                    // ),
                    // onReady: () {
                    //   _controller.addListener(listener);
                    // },
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
                                  ' 2020',
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
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
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
                              onPressed: () {},
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
                  child:
                      // Swiper(
                      //   itemBuilder: (BuildContext context, int index) {
                      //     return Image.network(
                      //       'https://4.bp.blogspot.com/-CJzAMtILkLA/XEQrxmj6p6I/AAAAAAAAMbo/VaLGgEeDy5YAAyKOO2UBbjPbwN2A6iNhACLcBGAs/s640/1_jfR0trcAPT3udktrFkOebA.jpg',
                      //       fit: BoxFit.fill,
                      //     );
                      //   },
                      //   itemCount: 8,
                      //   autoplay: true,
                      // ),
                      YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    // videoProgressIndicatorColor: Colors.amber,
                    // progressColors: ProgressColors(
                    //     playedColor: Colors.amber,
                    //     handleColor: Colors.amberAccent,
                    // ),
                    // onReady: () {
                    //   _controller.addListener(listener);
                    // },
                  ),
                ),
                Container(
                  height: 80,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      squareGradientButton(icon: Icons.people_rounded),
                      squareGradientButton(icon: Icons.attractions_rounded),
                      squareGradientButton(icon: Icons.auto_awesome_rounded),
                      squareGradientButton(icon: Icons.child_care_rounded),
                      squareGradientButton(icon: Icons.tv_rounded),
                      squareGradientButton(icon: Icons.movie_rounded),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 12,
                      itemBuilder: ((context, int index) {
                        return InkWell(
                          onTap: () {
                            _showPriview(index, model.results![index].id!);
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
                                              bottomRight: Radius.circular(10)),
                                          gradient: LinearGradient(
                                            begin: const FractionalOffset(
                                                0.0, 0.0),
                                            end: const FractionalOffset(
                                                0.0, 0.85),
                                            colors: <Color>[
                                              Colors.transparent,
                                              colorStyle.black()
                                            ],
                                          ),
                                        ),
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
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
                                            // Text(
                                            //   'read more...',
                                            //   style: styleText.lato(
                                            //       fontWeight: FontWeight.bold),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : loadingWidget(),
                        );
                      })),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
