import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/services/librart.dart';

/// 全局静态数据
class Global {
  /// 初始化
  static Future<void> init() async {
    /// 运行初始
    /// 用到了servis就需要处初始化，否则会报错
    WidgetsFlutterBinding.ensureInitialized();

    /// 硬盘储存初始化
    await Get.putAsync<MyStorageService>(() => MyStorageService().init());

    /// 导入用户全局 和 系统全局
    /// config：是系统信息
    /// user：用户信息
    Get.put(ConfigController());
    Get.put(UserController());
    Get.put(ResourceController());
  }
}
