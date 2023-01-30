import 'package:flutter/material.dart';

Widget loadingWidget() {
  return const SizedBox(
    height: 100,
    width: 100,
    child: Center(
      child: CircularProgressIndicator.adaptive(),
    ),
  );
}
