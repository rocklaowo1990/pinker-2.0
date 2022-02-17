import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinker/common/theme/colors.dart';
import 'package:pinker/common/theme/library.dart';

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
    backgroundColor: DarkColor.scaffoldBackground,

    // 提示颜色
    hintColor: DarkColor.hint,

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: DarkColor.primaryBackground,
      elevation: 1,
      shadowColor: Colors.white12,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: LightColor.primaryBackground,
        fontSize: 17,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),

    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryColor,
      onPrimary: Colors.red,
      secondary: Colors.red,
      onSecondary: Colors.red,
      background: Colors.red,
      onBackground: Colors.red,
      error: Colors.red,
      onError: Colors.red,
      surface: Colors.red,
      onSurface: Colors.red,
    ),

    // Switch
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.primaryColor),
      trackColor: MaterialStateProperty.all(DarkColor.switchBacground),
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

    // 主要背景色
    backgroundColor: LightColor.scaffoldBackground,

    // 提示颜色
    hintColor: LightColor.hint,

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: LightColor.primaryBackground,
      elevation: 1,
      shadowColor: Colors.black26,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: DarkColor.primaryBackground,
        fontSize: 17,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),

    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      onPrimary: Colors.red,
      secondary: Colors.red,
      onSecondary: Colors.red,
      background: Colors.red,
      onBackground: Colors.red,
      error: Colors.red,
      onError: Colors.red,
      surface: Colors.red,
      onSurface: Colors.red,
    ),

    // Switch
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.primaryColor),
      trackColor: MaterialStateProperty.all(LightColor.switchBacground),
    ),
  );
}
