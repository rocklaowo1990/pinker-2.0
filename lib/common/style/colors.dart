import 'package:flutter/widgets.dart';

class MyColors {
  /// 主色
  static const primary = Color(0XFF02BE02);

  /// 主要文字
  static const text = Color(0XFFFFFFFF);

  /// 次要文字
  static const secondText = Color(0X88FFFFFF);

  /// Switch
  static const switchColor = Color(0XFFEEEEEE);

  /// primaryBackground
  static const background = Color(0XFF0E0E11);
  static const background20 = Color(0X200E0E11);

  /// appbar
  static const appBar = Color(0XFF161619);

  /// input
  static const input = Color(0XFF25252B);

  /// 背景渐变色
  static const decorationColors = LinearGradient(
    colors: [Color(0XFF9331FF), Color(0XFF0090FF)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
