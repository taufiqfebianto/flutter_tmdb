import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_tmdb/models/on_air_series_response_model.dart';
import 'package:flutter_tmdb/models/popular_series_response_model.dart';

import '../../shared/shared.dart';
import '../../styles/styles.dart';
import '../../widgets/widgets.dart';
import 'bloc/series.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({super.key});

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  SeriesBloc? bloc;
  late OnAirSeriesResponseModel onAirModel = OnAirSeriesResponseModel();
  late PopularSeriesResponseModel popularModel = PopularSeriesResponseModel();

  SwiperController? swiperController;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<SeriesBloc>(context);
    bloc!.add(GetOnAirSeriesEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SeriesBloc, SeriesState>(
      listener: ((context, state) {
        if (state is GetOnAirSeriesSuccessState) {
          onAirModel = state.model;
          bloc!.add(GetPopularSeriesEvent());
        }
        if (state is GetPopularSeriesSuccessState) {
          popularModel = state.model;
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
                                    popularModel.results![index].name!,
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
                titleButton(onTap: () {}, title: 'On The Air'),
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
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: onAirModel.results?[index].posterPath != null
                                ? Image.network(
                                    '${Constants.baseImagePath}${onAirModel.results?[index].posterPath}',
                                    fit: BoxFit.cover)
                                : loadingWidget(),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                titleButton(onTap: () {}, title: 'Popular'),
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
                        onTap: () {},
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
              ],
            ),
          ),
        );
      },
    );
  }
}
