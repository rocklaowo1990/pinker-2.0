import 'package:flutter/material.dart';
import 'package:pinker/common/style/library.dart';

class MyText extends StatelessWidget {
  const MyText(
    this.data, {
    Key? key,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.ellipsis,
    this.color = MyColors.text,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.lineHeight = 1.0,
  }) : super(key: key);

  final String data;
  final int maxLines;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final double lineHeight;

  /// 32号的静态态字体
  static MyText welcom(String data) {
    return MyText(
      data,
      fontSize: 32,
      maxLines: 2,
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w300,
    );
  }

  /// 24号的静态字体
  static MyText text24(String data) => MyText(data, fontSize: 24);

  /// 20号的静态字体
  static MyText text20(String data) => MyText(data, fontSize: 20);

  /// 18号的静态字体
  static MyText text18(String data) => MyText(data, fontSize: 18);

  /// 18号的灰色文字
  static MyText gray18(String data) {
    return MyText(data, fontSize: 18, color: MyColors.secondText);
  }

  /// 16号的灰色文字
  static MyText gray16(
    String data, {
    double lineHeight = 1.0,
    int maxLines = 1,
  }) {
    return MyText(
      data,
      color: MyColors.secondText,
      lineHeight: lineHeight,
      maxLines: maxLines,
    );
  }

  /// 14号的灰色文字
  static MyText gray14(
    String data, {
    int maxLines = 1,
    double lineHeight = 1.0,
  }) {
    return MyText(
      data,
      fontSize: 14,
      color: MyColors.secondText,
      maxLines: maxLines,
      lineHeight: lineHeight,
    );
  }

  /// 14号的主色文字
  static MyText primary14(
    String data, {
    double lineHeight = 1.0,
  }) {
    return MyText(
      data,
      fontSize: 14,
      color: MyColors.primary,
      lineHeight: lineHeight,
    );
  }

  /// 16号的主色文字
  static MyText primary(String data) => MyText(data, color: MyColors.primary);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: lineHeight,
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
