import 'package:flutter/material.dart';
import 'package:flutter_tmdb/styles/colors.dart';
import 'package:flutter_tmdb/styles/fonts.dart';

Widget titleButton({
  required VoidCallback onTap,
  String? title,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? 'Any Text',
            style: styleText.lato(
              color: colorStyle.lightBlue(),
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.navigate_next_rounded,
            color: colorStyle.lightBlue(),
          ),
        ],
      ),
    ),
  );
}
