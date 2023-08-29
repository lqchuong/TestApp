import 'package:flutter/material.dart';
import 'package:acecook/src/themes/light_color.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  const TitleText(
      {Key? key,
      required this.text,
      this.fontSize = 18,
      this.color = LightColor.titleTextColor,
      this.fontWeight = FontWeight.w500})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: fontSize, fontWeight: fontWeight, color: color));
  }
}
