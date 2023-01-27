import 'package:flutter/material.dart';

import '../styles/styles.dart';

Widget squareGradientButton({
  IconData? icon
}) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    height: 80,
    width: 80,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[colorStyle.lightGreen(), colorStyle.lightBlue()],
      ),
    ),
    child: IconButton(
      onPressed: () {},
      icon: Icon(
        icon ?? Icons.settings_rounded,
        color: colorStyle.darkBlue(),
        size: 40,
      ),
    ),
  );
}
