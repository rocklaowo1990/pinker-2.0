part of 'theme.dart';

ThemeData themeLight = ThemeData(
  // 模式：亮色模式
  brightness: Brightness.light,

  // 页面背景色
  scaffoldBackgroundColor: AppColors.primaryColor,

  // 主要背景色
  backgroundColor: AppColors.primaryColor,

  // 提示颜色
  hintColor: AppColors.primaryColor,

  // AppBar
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    elevation: 1,
    shadowColor: Colors.black26,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: AppColors.primaryColor,
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
    trackColor: MaterialStateProperty.all(AppColors.switchBacground),
  ),
);
