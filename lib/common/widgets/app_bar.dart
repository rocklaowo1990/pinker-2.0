import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/public/library.dart';

import 'package:pinker/common/theme/library.dart';
import 'package:pinker/common/widgets/library.dart';

/// 初始页面的 AppBar
///
/// 带有一个logo，一个设置按钮和根据要求展示返回按钮
///
/// 一般只用在登陆注册那一套页面上
AppBar getFrameAppBar({
  Widget? leading,
  void Function()? onPressed,
}) {
  return AppBar(
    elevation: 0,
    title: AppIcons.logo,
    leading: leading,
    flexibleSpace: Obx(
      () => Container(
        color: ConfigStore.to.state.isDarkMode
            ? DarkColor.scaffoldBackground
            : LightColor.scaffoldBackground,
      ),
    ),
    actions: [
      getButton(
        child: AppIcons.set,
        onPressed: onPressed,
        width: 56.0,
        height: 56.0,
      )
    ],
  );
}

/// 默认的 AppBar
///
/// 带有一个返回键，title，和自定义设置actions

AppBar getAppBar({
  required String title,
  List<Widget>? actions,
  void Function()? onPressed,
}) {
  /// 设置按钮的点击事件：点击后去往设置页面
  void _onPressed() async {
    Get.back();
  }

  return AppBar(
    title: getText(title),
    leading: getButton(
      child: AppIcons.back,
      onPressed: onPressed ?? _onPressed,
    ),
    actions: actions,
  );
}
