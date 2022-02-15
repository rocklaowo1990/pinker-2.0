import 'package:flutter/material.dart';

/// 文本封装
/// 传入text size color
Widget getText(
  String? text, {
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  int? maxLines,
  TextOverflow? overflow,
  Color? color,
}) {
  return Text(
    text ?? '请输入文本',
    maxLines: maxLines,
    textAlign: textAlign,
    overflow: overflow,
    softWrap: true,
    style: TextStyle(
      color: color,
      height: 1.1,
      fontSize: fontSize ?? 15,
      fontWeight: fontWeight,
      decoration: TextDecoration.none,
    ),
  );
}

Widget getWelcomeTile(String text) {
  return getText(
    text,
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );
}
