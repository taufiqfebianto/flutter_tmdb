import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tmdb/pages/home/home_page.dart';
import 'package:flutter_tmdb/styles/colors.dart';

import '../../shared/shared.dart';
import '../movie/bloc/movie.dart';
import '../series/bloc/series.dart';
import 'bloc/hometab_bloc.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({super.key});

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  int _selectedTab = 1;

  Widget _activeTab(HometabState state, BuildContext context) {
    if (state == HometabState.movie) {
      return const MoviePage();
    }

    if (state == HometabState.series) {
      return const SeriesPage();
    }

    return const HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HometabBloc, HometabState>(listener: ((context, state) {
      // if (state == HometabState.movie) {
      //   title = 'Movie';
      // }
      // if (state == HometabState.tmdb) {
      //   title = 'TmDB';
      // }
      // if (state == HometabState.series) {
      //   title = 'Series';
      // }
    }), builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: colorStyle.darkBlue(),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu_rounded,
              color: colorStyle.lightBlue(),
            ),
          ),
          title: SizedBox(
            height: 30,
            child: Image.asset(
              Constants.logoShort,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_rounded,
                color: colorStyle.lightBlue(),
              ),
            ),
          ],
        ),
        body: _activeTab(state, context),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: colorStyle.darkBlue(),
          currentIndex: _selectedTab,
          selectedItemColor: colorStyle.lightGreen(),
          unselectedItemColor: colorStyle.lightBlue(),
          onTap: (int value) {
            BlocProvider.of<HometabBloc>(context).add(
              HometabChoose(
                tab: HometabState.values[value],
              ),
            );
            setState(() {
              _selectedTab = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_rounded), label: 'Movie'),
            BottomNavigationBarItem(
                icon: Icon(Icons.logo_dev_rounded), label: 'TMDB'),
            BottomNavigationBarItem(
                icon: Icon(Icons.tv_rounded), label: 'Series'),
          ],
        ),
      );
    });
  }
}
