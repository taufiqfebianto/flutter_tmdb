import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/shared.dart';
import '../../styles/styles.dart';
import 'bloc/preference.dart';

class PreferencePage extends StatefulWidget {
  const PreferencePage({super.key});

  @override
  State<PreferencePage> createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  PreferenceBloc? bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<PreferenceBloc>(context);
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
    return BlocConsumer<PreferenceBloc, PreferenceState>(
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
              'Preferences',
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
              padding: const EdgeInsets.all(25),
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Language',
                          style: styleText.lato(),
                        ),
                        const Switch.adaptive(value: true, onChanged: null),
                        Text(
                          'EN',
                          style: styleText.lato(),
                        ),
                      ],
                    ),
                    //  Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //      Text(
                    //       'Dark mode',
                    //       style: styleText.lato(),
                    //     ),
                    //     Switch.adaptive(value: true, onChanged: null),

                    //   ],
                    // ),
                    Image.asset(
                      Constants.altLong,
                      scale: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
