import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/home/home_page.dart';
import 'bloc/authentication_bloc.dart';

class Routers {
  static const String home = '/home';

  final route = <String, WidgetBuilder>{
    Routers.home: (BuildContext context) {
      return BlocBuilder<AuthenticationBloc, AuthenticationState>(
          bloc: BlocProvider.of<AuthenticationBloc>(context),
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticationAuthenticated) {
              return MultiBlocProvider(
                providers: [
                  // BlocProvider<StoryBloc>(
                  //   create: (BuildContext context) => StoryBloc(),
                  // ),
                  // BlocProvider<AddStoryBloc>(
                  //   create: (BuildContext context) => AddStoryBloc(),
                  // ),
                  // BlocProvider<DetailStoryBloc>(
                  //   create: (BuildContext context) => DetailStoryBloc(),
                  // ),
                ],
                child: const HomePage(),
              );
            }

            if (state is AuthenticationUnauthenticated) {
              return const CircularProgressIndicator.adaptive();
            }

            // return const SplashPage();
            return const CircularProgressIndicator.adaptive();
          });
    },
    // Routers.register: (BuildContext context) {
    //   return BlocProvider<RegisterBloc>(
    //     create: (BuildContext context) => RegisterBloc(),
    //     child: const RegisterPage(),
    //   );
    // },
  };
}
