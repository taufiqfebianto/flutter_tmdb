import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/home/bloc/home.dart';
import '../pages/hometab/bloc/hometab.dart';
import '../pages/more/bloc/more.dart';
import '../pages/movie/bloc/movie.dart';
import '../pages/series/bloc/series.dart';
import '../pages/splash_page.dart';
import 'bloc/authentication_bloc.dart';

class Routers {
  static const String home = '/home';
  static const String more = '/more';

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
        child: const MorePage(),
      );
    },
  };
}
