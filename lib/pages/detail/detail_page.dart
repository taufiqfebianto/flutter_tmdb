import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tmdb/styles/colors.dart';

import 'bloc/detail.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailBloc, DetailState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorStyle.black(),
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [Text('Detail Page')],
            ),
          ),
        );
      },
    );
  }
}
