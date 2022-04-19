import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText(
    this.data, {
    Key? key,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.overflow = TextOverflow.clip,
    this.color = Colors.white,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  final String data;
  final int maxLines;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  static MyText welcome(String data) {
    return MyText(
      data,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      maxLines: 2,
      textAlign: TextAlign.start,
    );
  }

  static MyText title(String data) => MyText(data, fontSize: 18);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: color,
      height: 1.1,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
    return Text(
      data,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      softWrap: true,
      style: textStyle,
    );
  }
}
