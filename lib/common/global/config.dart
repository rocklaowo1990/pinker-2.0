import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:pinker/common/constant/library.dart';
import 'package:pinker/common/lang/library.dart';
import 'package:pinker/common/services/librart.dart';
import 'package:pinker/common/utils/library.dart';

class ConfigController extends GetxController {
  static ConfigController get to => Get.find();

  /// 是否曾经使用过APP，
  bool isHaveUsed = MyStorageService.to.getBool(storageIsHaveUsedKey);

  /// 系统类型
  String? platform;

  /// 手机系统版本
  String? osversion;

  /// APP版本
  String? version;

  /// 机型
  String? model;

  /// 包信息
  PackageInfo? packageInfo;

  /// 语言设置
  final locale = const Locale('en', 'US').obs;

  @override
  void onReady() async {
    super.onReady();

    /// 读取设备信息
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (GetPlatform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      platform = 'android';
      osversion = 'Android ${androidInfo.version.sdkInt}';
      model = androidInfo.model;
    } else if (GetPlatform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      platform = 'ios';
      osversion = 'IOS ${iosInfo.systemVersion}';
      model = iosInfo.model;
    }

    /// 包信息
    packageInfo = await PackageInfo.fromPlatform();

    /// 读取储存的语言设置
    var localeString = MyStorageService.to.getString(storageLocalKey);

    if (localeString.isEmpty) {
      locale.value = TranslationService.locale;
    } else if (localeString == 'zh_CN') {
      locale.value = const Locale('zh', 'CN');
    } else if (localeString == 'en_US') {
      locale.value = const Locale('en', 'US');
    } else {
      locale.value = const Locale('ve', 'NA');
    }
    locale.update((val) {});

    /// 设置安卓状态栏
    await SystemStye.getTransparentStatusBar();

    /// 设置竖屏
    await SystemStye.setPreferredOrientations();
  }
}
