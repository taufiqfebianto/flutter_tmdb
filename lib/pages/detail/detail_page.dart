import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tmdb/styles/colors.dart';

import '../../shared/shared.dart';
import '../../styles/styles.dart';
import '../../widgets/widgets.dart';
import 'bloc/detail.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DetailBloc? bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<DetailBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _onBack() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailBloc, DetailState>(
      listener: ((context, state) {}),
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
            title: Text(
              'Title Movies',
              style: styleText.lato(
                  fontWeight: FontWeight.bold,
                  color: colorStyle.lightBlue(),
                  fontSize: 18),
            ),
            actions: [
              IconButton(
                onPressed: (() {}),
                icon: Icon(
                  Icons.search_rounded,
                  color: colorStyle.lightBlue(),
                ),
              )
            ],
            backgroundColor: colorStyle.darkBlue(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: ListView(
              children: [
                Image.network(
                  'https://4.bp.blogspot.com/-CJzAMtILkLA/XEQrxmj6p6I/AAAAAAAAMbo/VaLGgEeDy5YAAyKOO2UBbjPbwN2A6iNhACLcBGAs/s640/1_jfR0trcAPT3udktrFkOebA.jpg',
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                  'https://s1.bukalapak.com/img/68286857232/large/Poster_Film___Avengers_Endgame___Marvel_Studios___Movie_Post.jpg',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Movie Title',
                                  style: styleText.lato(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'Genre - Genre - Genre',
                                  style: styleText.lato(),
                                ),
                                Text(
                                  '2022',
                                  style: styleText.lato(),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        Constants.sysnopsis,
                        textAlign: TextAlign.justify,
                        style: styleText.lato(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Starring Ralph, Joko, Roy, Nicholas',
                        style: styleText.lato(
                          color: colorStyle.white().withOpacity(0.7),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.download_rounded,
                          color: colorStyle.lightBlue(),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_rounded,
                          color: colorStyle.lightBlue(),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share_rounded,
                          color: colorStyle.lightBlue(),
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   margin: const EdgeInsets.symmetric(vertical: 15),
                //   child: Text(
                //     'Trailer',
                //     style: styleText.lato(
                //         fontWeight: FontWeight.bold,
                //         color: colorStyle.lightBlue(),
                //         fontSize: 18),
                //   ),
                // ),
                // listTrailer(),
                titleButton(onTap: () {}, title: 'More Like This'),
                listMovie()
              ],
            ),
          ),
        );
      },
    );
  }
}
