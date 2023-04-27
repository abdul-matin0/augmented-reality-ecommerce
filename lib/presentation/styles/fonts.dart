import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halcera/presentation/styles/colors.dart';

/// urbanist font style
TextStyle urbanistFontStyle(
    {TextStyle? textStyle,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    Color? color = blackOneFontColor}) {
  return GoogleFonts.urbanist(
      textStyle: textStyle,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle);
}
