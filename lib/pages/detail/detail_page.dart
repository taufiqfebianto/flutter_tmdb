import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tmdb/models/popular_movie_response_model.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../shared/shared.dart';
import '../../styles/styles.dart';
import '../../widgets/widgets.dart';
import 'bloc/detail.dart';

class DetailPage extends StatefulWidget {
  final PopularMovieResponseModel? model;
  final int? index;
  final String? videoId;
  const DetailPage({super.key, this.model, this.index, this.videoId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DetailBloc? bloc;
  String? initialVideo;

  late YoutubePlayerController _videoController;

  @override
  void initState() {
    bloc = BlocProvider.of<DetailBloc>(context);

    _videoController = YoutubePlayerController(
      initialVideoId: widget.videoId!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _onBack() {
    Navigator.of(context).popUntil(ModalRoute.withName(Routers.home));
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailBloc, DetailState>(
      listener: ((context, state) {
        if (state is GetVideoSuccessState) {
          initialVideo = state.model.results![0].key;
        }
      }),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorStyle.black(),
          appBar: AppBar(
            leading: IconButton(
              onPressed: _onBack,
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: colorStyle.lightBlue(),
              ),
            ),
            title: Wrap(children: [
              Text(
                widget.model!.results![widget.index!].title!,
                style: styleText.lato(
                    fontWeight: FontWeight.bold,
                    color: colorStyle.lightBlue(),
                    fontSize: 18),
              ),
            ]),
            backgroundColor: colorStyle.darkBlue(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: ListView(
              children: [
                YoutubePlayer(
                  controller: _videoController,
                  showVideoProgressIndicator: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                                '${Constants.baseImagePath}${widget.model!.results![widget.index!].posterPath!}',
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Wrap(
                                  children: [
                                    Text(
                                      widget.model!.results![widget.index!]
                                          .title!,
                                      style: styleText.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Genre - Genre - Genre',
                                style: styleText.lato(),
                              ),
                              Text(
                                DateFormat('yyyy').format(widget.model!
                                    .results![widget.index!].releaseDate!),
                                style: styleText.lato(),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.model!.results![widget.index!].overview!,
                      textAlign: TextAlign.justify,
                      style: styleText.lato(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Starring Tom, Catherin, Ralph, Roy, Nicholas',
                      style: styleText.lato(
                        color: colorStyle.white().withOpacity(0.7),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
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
                            padding: const EdgeInsets.all(0),
                            onPressed: () {},
                            icon: Icon(
                              Icons.play_arrow_rounded,
                              color: colorStyle.lightBlue(),
                            ),
                          ),
                          Text(
                            'Watch',
                            style: styleText.lato(
                              color: colorStyle.lightBlue(),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {},
                            icon: Icon(
                              Icons.share_rounded,
                              color: colorStyle.lightBlue(),
                            ),
                          ),
                          Text(
                            'Share',
                            style: styleText.lato(
                              color: colorStyle.lightBlue(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                titleButton(onTap: () {}, title: 'More Like This'),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: ((context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routers.detail,
                              arguments: [widget.model, index]);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: widget.model!.results![index].posterPath !=
                                    null
                                ? Image.network(
                                    '${Constants.baseImagePath}${widget.model!.results![index].posterPath}',
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
