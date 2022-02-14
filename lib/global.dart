import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinker_project/common/store/library.dart';
import 'package:pinker_project/common/utils/library.dart';

/// 全局静态数据
class Global {
  /// 初始化
  static Future init() async {
    /// 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    // 强制竖屏
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // _setSystemUi();

    await Get.putAsync<StorageService>(() => StorageService().init());

    Get.put<ConfigStore>(ConfigStore());
    Get.put<UserStore>(UserStore());
  }

  // static void _setSystemUi() {
  //   if (GetPlatform.isAndroid) {
  //     SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent,
  //       statusBarBrightness: Brightness.light,
  //       statusBarIconBrightness: Brightness.dark,
  //       systemNavigationBarDividerColor: Colors.transparent,
  //       systemNavigationBarColor: Colors.white,
  //       systemNavigationBarIconBrightness: Brightness.dark,
  //     );
  //     SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  //   }
  // }
}
