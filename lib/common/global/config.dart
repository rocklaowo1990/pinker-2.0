import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:pinker/common/constant/library.dart';
import 'package:pinker/common/utils/library.dart';

class ConfigStore extends GetxController {
  static ConfigStore get to => Get.find();

  final _isLightMode = StorageService.to.getBool(storageIsLightModeKey).obs;
  set isLightMode(bool value) => _isLightMode.value = value;
  bool get isLightMode => _isLightMode.value;

  /// 是否曾经使用过APP，
  bool isHaveUsed = StorageService.to.getBool(storageIsHaveUsed);

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

  /// 改变状态栏的文字颜色
  static void changeSystem() {
    bool _isLight = ConfigStore.to.isLightMode;

    var light = Brightness.light;
    var dark = Brightness.dark;

    var style = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: _isLight ? dark : light,
      statusBarIconBrightness: _isLight ? dark : light,
      statusBarBrightness: _isLight ? light : dark,
    );

    SystemChrome.setSystemUIOverlayStyle(style);
  }

  @override
  void onReady() async {
    super.onReady();

    /// 初始化状态栏文字颜色
    changeSystem();

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
  }
}
