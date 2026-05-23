
import 'package:daffy/constants/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';
class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String? fontFamily;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;
  final TextDecoration decoration;
  final double letterSpacing;
  final double wordSpacing;
  final double lineheight;
  final FontStyle fontStyle;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.color = kBlack,
    this.fontSize = 15,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.decoration = TextDecoration.none,
    this.letterSpacing = 0.0,
    this.wordSpacing = 0.0,
    this.fontStyle = FontStyle.normal,
    this.lineheight = 1.2,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style:  TextStyle(
        
        fontSize: f(context, fontSize),
        color: color,
        fontWeight: fontWeight,
        fontFamily: fontFamily ?? AppFonts.pjs700 ,

        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        decoration: decoration,
        height: lineheight,
      ),
      maxLines: maxLines ?? 3,
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
