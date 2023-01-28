import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/bloc/authentication_bloc.dart';
import '../shared/shared.dart';
import '../styles/styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AuthenticationBloc? bloc;
  String status = 'Loading.....';
  // String? token;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<AuthenticationBloc>(context);
    bloc!.add(GetTokenEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  _putToken(String? token) async {
    storage.putString(
        boxName: describeEnum(StorageConstants.user),
        key: 'token',
        value: token);
    bloc!.add(ValidateTokenEvent());
  }

  _putSession(String? session) async {
    storage.putString(
        boxName: describeEnum(StorageConstants.user),
        key: 'session',
        value: session);

    bloc!.add(LoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: ((context, state) {
        if (state is GetTokenSuccessState) {
          status = 'Get authentication token success';
          _putToken(state.model.requestToken);
        }
        if (state is ValidateTokenSuccessState) {
          status = 'Validate authentication token success';
          bloc!.add(GetSessionEvent());
        }
        if (state is GetSessionSuccessState) {
          status = 'Application ready';
          _putSession(state.model.sessionId);
        }
      }),
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[colorStyle.darkBlue(), colorStyle.lightBlue()],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  Constants.altLong,
                  scale: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CircularProgressIndicator.adaptive(),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    status,
                    style: styleText.lato(color: colorStyle.darkBlue()),
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
