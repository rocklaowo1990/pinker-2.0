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

    //显示顶部栏(隐藏底部栏，没有这个的话底部状态栏的透明度无法实现)
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    // 强制竖屏
    var option = [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown];
    await SystemChrome.setPreferredOrientations(option);

    // 硬盘储存初始化
    await Get.putAsync<StorageService>(() => StorageService().init());

    // 导入用户全局 和 系统全局
    // config：是系统信息
    // user：用户信息
    Get.put<ConfigStore>(ConfigStore());
    Get.put<UserStore>(UserStore());
  }
}
