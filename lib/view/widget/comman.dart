import 'package:clipcuts/resources/const/font_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

textStyle(
    {double? fontSize = 16,
      TextDecoration? textDecoration,
      FontWeight? fontWeight = FontWeight.w400,
      double? height,
      double? letterSpacing = 0.5,
      List<Shadow>? shadows,
      Color? color = Colors.black,
      FontStyle? fontStyle,
      fontFamily = ralewayFont}) {
  return TextStyle(
    color: color,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontSize: fontSize?.sp,
    height: height,
    shadows: shadows,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    decoration: textDecoration ?? TextDecoration.none,
  );
}