import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:pinker/common/constant/library.dart';
import 'package:pinker/common/services/librart.dart';
import 'package:pinker/common/style/colors.dart';
import 'package:pinker/common/utils/library.dart';
import 'package:pinker/common/widgets/library.dart';

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

  /// 将顶部状态栏和底部状态栏设置成透明
  Future<void> getTransparentStatusBar() async {
    /// 显示顶部栏(隐藏底部栏，没有这个的话底部状态栏的透明度无法实现)
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    const style = SystemUiOverlayStyle(
      statusBarColor: MyColors.transparent,
      systemNavigationBarColor: MyColors.transparent,
      systemNavigationBarDividerColor: MyColors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    );

    SystemChrome.setSystemUIOverlayStyle(style);
  }

  /// 弹窗：重试
  Future<void> errorDaliog(ErrorEntity eInfo) async {
    return getDaliog(
      child: DialogChild.oneButton(
        title: eInfo.message,
        content: '请点击重试按钮尝试重新连接',
        buttonText: '重试',
        onTap: () => Get.back(),
      ),
    );
  }

  /// 弹窗：loading
  Future<void> loading() async {
    return getDaliog(child: DialogChild.loading());
  }

  /// 顶部弹窗
  Future<void> errorSnakBar(ErrorEntity eInfo) async {
    getSnakBar(eInfo.message, '请稍后重试');
  }

  /// 顶部弹窗的封装
  void getSnakBar(
    String title,
    String message,
  ) {
    Get.snackbar(
      title,
      message,
      colorText: MyColors.text,
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 500),
    );
  }

  /// 中间弹窗
  Future<void> getDaliog({required Widget child}) {
    return Get.dialog(child, useSafeArea: false);
  }

  /// 强制竖屏：用到了SystemChrome服务，所以需要初始化
  Future<void> setPreferredOrientations() async {
    /// 强制竖屏：用到了SystemChrome服务，所以需要初始化
    /// 如：WidgetsFlutterBinding.ensureInitialized();
    var option = [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown];
    await SystemChrome.setPreferredOrientations(option);
  }

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

    /// 设置安卓状态栏
    await getTransparentStatusBar();

    /// 设置竖屏
    await setPreferredOrientations();
  }
}
