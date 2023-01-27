import 'dart:ui';

// ignore: implementation_imports
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

import 'styles.dart';

class StyleText {
  TextStyle lato({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.lato(
        color: color ?? colorStyle.white(),
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 14);
  }
}

final styleText = StyleText();
