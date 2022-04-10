import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinker/common/theme/colors.dart';
import 'package:pinker/common/theme/library.dart';

part 'dark.dart';
part 'light.dart';

class AppTheme {
  static const horizontalMargin = 16.0;
  static const radius = 10.0;

  /// 模式：深色模式
  ///
  /// 拥有独立的深色桃色
  ///
  /// 在设置里可以自由切换到亮色模式
  static ThemeData dark = themeDark;

  /// 模式：亮色模式
  ///
  /// 拥有独立的亮色颜色套
  ///
  /// 在设置里可以自由切换到深色模式
  static ThemeData light = themeLight;
}
