import 'package:flutter/widgets.dart';

class AppColors {
  /// 主色
  static const Color primaryColor = Color(0xff0c7dff);

  /// Switch
  static const Color switchBacground = Color(0xffeeeeee);

  /// primaryBackground
  static const Color primaryBackgroundLight = Color(0xffeeeeee);
  static const Color primaryBackgroundDark = Color(0xffeeeeee);

  /// 背景渐变色
  static const LinearGradient decorationColors = LinearGradient(
    colors: [Color(0xff9331ff), Color(0xff0090ff)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
