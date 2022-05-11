import 'package:flutter/material.dart';

part 'dark.dart';
part 'light.dart';

class MyTheme {
  static const borderRadius = BorderRadius.all(Radius.circular(8));
  static const decoration = BoxDecoration(shape: BoxShape.rectangle);
  static ThemeData dark = themeDark;
  static ThemeData light = themeLight;
}
