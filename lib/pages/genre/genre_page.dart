import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/shared.dart';
import '../../styles/styles.dart';
import 'bloc/genre_bloc.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({super.key});

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  GenreBloc? bloc;

  List<String> genreType = [
    'DRAMA',
    'FAMILY',
    'COMEDY',
    'ACTION',
    'DOCUMENTARY',
    'HORROR',
    'THRILLER',
    'KIDS',
    'SUPERHERO',
    'REALITY',
    'TEEN',
    'MUSICAL',
  ];

  @override
  void initState() {
    bloc = BlocProvider.of<GenreBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _onBack() {
    Navigator.of(context).popUntil(ModalRoute.withName(Routers.home));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenreBloc, GenreState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorStyle.black(),
          appBar: AppBar(
            shadowColor: colorStyle.transparent(),
            leading: IconButton(
              onPressed: _onBack,
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: colorStyle.lightBlue(),
              ),
            ),
            title: Text(
              'Genre',
              style: styleText.lato(
                  fontWeight: FontWeight.bold,
                  color: colorStyle.lightBlue(),
                  fontSize: 18),
            ),
            backgroundColor: colorStyle.darkBlue(),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[colorStyle.darkBlue(), colorStyle.black()],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: genreType.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Center(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child:
                                  // widget.model!.results![index].posterPath != null
                                  //     ?
                                  Image.asset(
                                Constants.poster,
                                fit: BoxFit.fill,
                                opacity: const AlwaysStoppedAnimation(.3),
                              )
                              // : loadingWidget(),
                              ),
                        ),
                        Center(
                          child: Text(
                            genreType[index],
                            style: styleText.lato(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        );
      },
    );
  }
}
