import 'package:flutter/material.dart';

import '../styles/styles.dart';

Widget squareGradientButton({
  IconData? icon,
  String? text,
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
        colors: <Color>[colorStyle.darkBlue(), colorStyle.lightBlue()],
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {},
          icon: Icon(
            icon ?? Icons.settings_rounded,
            color: colorStyle.lightGreen().withOpacity(0.6),
            size: 40,
          ),
        ),
        Text(
          text ?? 'Title',
          style: styleText.lato(
            color: colorStyle.darkBlue(),
          ),
        )
      ],
    ),
  );
}
