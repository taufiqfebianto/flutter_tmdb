import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/detail/bloc/detail.dart';
import '../pages/download/bloc/download.dart';
import '../pages/genre/bloc/genre.dart';
import '../pages/home/bloc/home.dart';
import '../pages/hometab/bloc/hometab.dart';
import '../pages/more/bloc/more.dart';
import '../pages/movie/bloc/movie.dart';
import '../pages/preference/bloc/preference.dart';
import '../pages/series/bloc/series.dart';
import '../pages/splash_page.dart';
import '../pages/watchlist/bloc/watchlist.dart';
import 'bloc/authentication_bloc.dart';

class Routers {
  static const String home = '/home';
  static const String more = '/more';
  static const String detail = '/detail';
  static const String download = '/download';
  static const String watchlist = '/watchlist';
  static const String popular = '/popular';
  static const String nowPlaying = '/nowPlaying';
  static const String upcoming = '/upcoming';
  static const String genre = '/genre';
  static const String preferences = '/preferences';

  final route = <String, WidgetBuilder>{
    Routers.home: (BuildContext context) {
      return BlocBuilder<AuthenticationBloc, AuthenticationState>(
          bloc: BlocProvider.of<AuthenticationBloc>(context),
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticationAuthenticated) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider<HometabBloc>(
                    create: (BuildContext context) => HometabBloc(),
                  ),
                  BlocProvider<HomeBloc>(
                    create: (BuildContext context) => HomeBloc(),
                  ),
                  BlocProvider<MovieBloc>(
                    create: (BuildContext context) => MovieBloc(),
                  ),
                  BlocProvider<SeriesBloc>(
                    create: (BuildContext context) => SeriesBloc(),
                  ),
                ],
                child: const HomeTabPage(),
              );
            }

            if (state is AuthenticationUnauthenticated) {
              return const CircularProgressIndicator.adaptive();
            }

            return const SplashPage();
          });
    },
    Routers.more: (BuildContext context) {
      return BlocProvider<MoreBloc>(
        create: (BuildContext context) => MoreBloc(),
        child: MorePage(
            model: (ModalRoute.of(context) as dynamic).settings.arguments),
      );
    },
    Routers.detail: (BuildContext context) {
      List<dynamic> args =
          (ModalRoute.of(context) as dynamic).settings.arguments;
      return BlocProvider<DetailBloc>(
        create: (BuildContext context) => DetailBloc(),
        child: DetailPage(model: args[0], index: args[1]),
      );
    },
    Routers.download: (BuildContext context) {
      return BlocProvider<DownloadBloc>(
        create: (BuildContext context) => DownloadBloc(),
        child: const DownloadPage(),
      );
    },
    Routers.watchlist: (BuildContext context) {
      return BlocProvider<WatchlistBloc>(
        create: (BuildContext context) => WatchlistBloc(),
        child: const WatchlistPage(),
      );
    },
    // Routers.popular: (BuildContext context) {
    //   return BlocProvider<MoreBloc>(
    //     create: (BuildContext context) => MoreBloc(),
    //     child: PopularPage(),
    //   );
    // },
    // Routers.nowPlaying: (BuildContext context) {
    //   return BlocProvider<MoreBloc>(
    //     create: (BuildContext context) => MoreBloc(),
    //     child: NowPlayingPage(),
    //   );
    // },
    // Routers.upcoming: (BuildContext context) {
    //   return BlocProvider<MoreBloc>(
    //     create: (BuildContext context) => MoreBloc(),
    //     child: UpcomingPage(),
    //   );
    // },
    Routers.genre: (BuildContext context) {
      return BlocProvider<GenreBloc>(
        create: (BuildContext context) => GenreBloc(),
        child: const GenrePage(),
      );
    },
    Routers.preferences: (BuildContext context) {
      return BlocProvider<PreferenceBloc>(
        create: (BuildContext context) => PreferenceBloc(),
        child: const PreferencePage(),
      );
    },
  };
}
