import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tmdb/pages/home/home_page.dart';
import 'package:flutter_tmdb/styles/colors.dart';
import 'package:flutter_tmdb/styles/fonts.dart';

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
  HometabBloc? bloc;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
  void initState() {
    bloc = BlocProvider.of<HometabBloc>(context);
    super.initState();
  }

  _onExit() {
    bloc!.add(DeleteSessionEvent());
    debugPrint('TAP');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HometabBloc, HometabState>(listener: ((context, state) {
      if (state == HometabState.exit) {
        exit(0);
      }
    }), builder: (context, state) {
      return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: colorStyle.transparent(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[colorStyle.darkBlue(), colorStyle.lightBlue()],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DrawerHeader(
                  child: Image.asset(
                    Constants.logo,
                    scale: 1.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    // thickness: 1,
                    color: colorStyle.darkBlue(),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    leading: Icon(Icons.download_rounded),
                    title: Text('Download'),
                    // subtitle: Text('save to watch later'),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    leading: Icon(Icons.playlist_add_rounded),
                    title: Text('Watchlist'),
                    // subtitle: Text('save to watch later'),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    leading: Icon(Icons.timeline_outlined),
                    title: Text('Popular'),
                    subtitle: Text('popular movie & tv series'),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    leading: Icon(Icons.av_timer_rounded),
                    title: Text('Upcoming'),
                    subtitle: Text('upcoming movie & tv series'),
                  ),
                ),

                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    leading: Icon(Icons.movie_rounded),
                    title: Text('Genre'),
                    subtitle: Text('category movie & tv series'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    // thickness: 1,
                    color: colorStyle.darkBlue(),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    leading: Icon(Icons.settings_rounded),
                    title: Text('Preference'),
                  ),
                ),
                // const ListTile(
                //   leading: Icon(Icons.question_mark_rounded),
                //   title: Text('Help'),
                // ),
                InkWell(
                  onTap: () {
                    _onExit();
                  },
                  child: const ListTile(
                    leading: Icon(Icons.logout_rounded),
                    title: Text('Exit'),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Divider(
                // thickness: 1,
                //     color: colorStyle.lightGreen(),
                //   ),
                // ),
                Column(
                  children: [
                    Text(
                      '- Flutter TMDB -',
                      style: styleText.lato(color: colorStyle.darkBlue()),
                    ),
                    Text(
                      'developed by taufiqfebianto',
                      style: styleText.lato(
                        fontSize: 10,
                        color: colorStyle.darkBlue(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: colorStyle.darkBlue(),
          leading: IconButton(
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
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
