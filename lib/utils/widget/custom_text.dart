import 'package:flutter/material.dart';
import 'package:watchn/gen/fonts.gen.dart';

class CustomText extends StatelessWidget {
  final Color? color;
  final String text;
  final String? fontFamily;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final double? height;
  final double? fontSize;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final double? decorThickness;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;

  CustomText(
      {required this.text,
      this.color,
      this.fontFamily,
      this.height,
      this.maxLines,
      this.fontSize,
      this.letterSpacing,
      this.fontWeight,
      this.textAlign,
      this.textDecoration,
      this.textOverflow,
      this.decorThickness,
      this.fontStyle,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      style: TextStyle(
          color: color,
          fontFamily: FontFamily.helveticaNowDisplay,
          fontSize: fontSize,
          height: height,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          decoration: textDecoration,
          decorationThickness: decorThickness,
          fontStyle: fontStyle),
    );
  }
}
