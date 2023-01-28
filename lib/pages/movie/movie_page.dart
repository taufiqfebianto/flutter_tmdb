import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_tmdb/styles/colors.dart';
import 'package:flutter_tmdb/widgets/widgets.dart';

import '../../shared/shared.dart';
import 'bloc/movie.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
      listener: ((context, state) {
        if (state is GetLatestMovieSuccessState) {
          debugPrint(state.toString());
        }
        if (state is GetPopularMovieSuccessState) {
          debugPrint(state.toString());
        }
        if (state is GetUpcomingMovieSuccessState) {
          debugPrint(state.toString());
        }
        if (state is GetTopratedMovieSuccessState) {
          debugPrint(state.toString());
        }
        if (state is GetNowPlayingdMovieSuccessState) {
          debugPrint(state.toString());
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
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        'https://4.bp.blogspot.com/-CJzAMtILkLA/XEQrxmj6p6I/AAAAAAAAMbo/VaLGgEeDy5YAAyKOO2UBbjPbwN2A6iNhACLcBGAs/s640/1_jfR0trcAPT3udktrFkOebA.jpg',
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: 8,
                    autoplay: true,
                  ),
                ),

                titleButton(onTap: () {}, title: 'Continue Watching'),
                listMovie(),
                titleButton(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routers.more);
                    },
                    title: 'Popular'),
                // listMovie(),
                // titleButton(onTap: () {},title: 'Best 10 of the months'),
                listMovie(),
                titleButton(onTap: () {}, title: 'Upcoming'),
                listMovie()
              ],
            ),
          ),
        );
      },
    );
  }
}
