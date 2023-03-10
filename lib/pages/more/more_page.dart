import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tmdb/models/popular_movie_response_model.dart';
import 'package:flutter_tmdb/styles/colors.dart';
import 'package:flutter_tmdb/styles/fonts.dart';
import 'package:flutter_tmdb/widgets/widgets.dart';

import '../../shared/shared.dart';
import 'bloc/more.dart';

class MorePage extends StatefulWidget {
  final PopularMovieResponseModel? model;
  const MorePage({super.key, this.model});

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
    Navigator.of(context).popUntil(ModalRoute.withName(Routers.home));
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
            padding: const EdgeInsets.all( 10),
            child: GridView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: widget.model?.results?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: widget.model!.results![index].posterPath != null
                        ? Image.network(
                            '${Constants.baseImagePath}${widget.model!.results![index].posterPath}',
                            fit: BoxFit.fill)
                        : loadingWidget(),
                  );
                }),
          ),
        );
      },
    );
  }
}
