import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_tmdb/shared/shared.dart';
import 'package:flutter_tmdb/styles/colors.dart';
import 'package:flutter_tmdb/styles/fonts.dart';

import '../../widgets/widgets.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorStyle.black(),
          body: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
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
                      itemCount: 6,
                      itemBuilder: ((context, index) {
                        return Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              height: 300,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                //  const BorderRadius.only(
                                //     topLeft: Radius.circular(10),
                                //     topRight: Radius.circular(10)),
                                child: Image.network(
                                    'https://4.bp.blogspot.com/-CJzAMtILkLA/XEQrxmj6p6I/AAAAAAAAMbo/VaLGgEeDy5YAAyKOO2UBbjPbwN2A6iNhACLcBGAs/s640/1_jfR0trcAPT3udktrFkOebA.jpg',
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
                                    // begin: Alignment.topCenter,
                                    // end: Alignment.bottomCenter,
                                    begin: const FractionalOffset(0.0, 0.0),
                                    end: const FractionalOffset(0.0, 0.85),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Title Movie',
                                      style: styleText.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      
                                      Constants.sysnopsis,
                                      style: styleText.lato(),
                                      softWrap: true,
                                    ),
                                     const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'read more...',
                                      style: styleText.lato(
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
