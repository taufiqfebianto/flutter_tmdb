import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tmdb/styles/colors.dart';
import 'package:flutter_tmdb/styles/fonts.dart';

import 'bloc/more.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  MoreBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<MoreBloc>(context);
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
    return BlocConsumer<MoreBloc, MoreState>(
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
              'Popular Movies',
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
            padding: const EdgeInsets.symmetric(horizontal:10),
            child: GridView.builder(
              padding: const EdgeInsets.all(0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                          'https://s1.bukalapak.com/img/68286857232/large/Poster_Film___Avengers_Endgame___Marvel_Studios___Movie_Post.jpg',
                          fit: BoxFit.cover),
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
