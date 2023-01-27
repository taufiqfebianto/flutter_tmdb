import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_tmdb/styles/colors.dart';

import '../../widgets/widgets.dart';
import 'bloc/series.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({super.key});

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SeriesBloc, SeriesState>(
      listener: ((context, state) {}),
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
                titleButton(onTap: () {},title: 'Continue Watching'),
                listMovie(),
                titleButton(onTap: () {},title: 'Commedy'),
                listMovie(),
                titleButton(onTap: () {},title: 'Action'),
                listMovie(),
                titleButton(onTap: () {},title: 'Thriller'),
                listMovie()
              ],
            ),
          ),
        );
      },
    );
  }
}
