import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/utils/library.dart';

/// 全局静态数据
class Global {
  /// 初始化
  static Future init() async {
    /// 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    // 强制竖屏
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // 硬盘储存初始化
    await Get.putAsync<StorageService>(() => StorageService().init());

    // 导入用户全局 和 系统全局
    // config：是系统信息
    // user：用户信息
    Get.put<ConfigStore>(ConfigStore());
    Get.put<UserStore>(UserStore());
  }
}
