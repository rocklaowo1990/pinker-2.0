import 'package:flutter/material.dart';
import 'package:pinker_project/common/theme/library.dart';

class AppTheme {
  static const horizontalMargin = 16.0;
  static const radius = 10.0;

  /// 模式：深色模式
  ///
  /// 拥有独立的深色桃色
  ///
  /// 在设置里可以自由切换到亮色模式
  static ThemeData dark = ThemeData(
    // 模式：暗色模式
    brightness: Brightness.dark,

    // 页面背景色
    scaffoldBackgroundColor: DarkColor.scaffoldBackground,

    // 主要背景色
    backgroundColor: DarkColor.primaryBackground,

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: DarkColor.primaryBackground,
      elevation: 1,
      shadowColor: Colors.white24,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
  );

  /// 模式：亮色模式
  ///
  /// 拥有独立的亮色颜色套
  ///
  /// 在设置里可以自由切换到深色模式
  static ThemeData light = ThemeData(
    // 模式：亮色模式
    brightness: Brightness.light,

    // 页面背景色
    scaffoldBackgroundColor: LightColor.scaffoldBackground,

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: LightColor.primaryBackground,
      elevation: 1,
      shadowColor: Colors.black12,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    ),
  );
}
