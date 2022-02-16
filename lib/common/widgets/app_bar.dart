import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinker/common/routes/library.dart';

import 'package:pinker/common/store/library.dart';
import 'package:pinker/common/theme/library.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/common/widgets/text.dart';

/// 初始页面的 AppBar
///
/// 带有一个logo，一个设置按钮和根据要求展示返回按钮
///
/// 一般只用在登陆注册那一套页面上
AppBar getFrameAppBar({
  Widget? leading,
}) {
  /// 设置按钮的点击事件：点击后去往设置页面
  void _onPressed() {
    Get.toNamed(AppRoutes.set);
  }

  return AppBar(
    elevation: 0,
    title: getIconLogo(),
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
        child: Obx(
          () => SvgPicture.asset(
            'assets/svg/set.svg',
            color: ConfigStore.to.state.isDarkMode
                ? LightColor.scaffoldBackground
                : DarkColor.scaffoldBackground,
          ),
        ),
        onPressed: _onPressed,
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
}) {
  /// 设置按钮的点击事件：点击后去往设置页面
  void _onPressed() {
    Get.back();
  }

  return AppBar(
    title: getText(title),
    leading: getButton(
      child: Obx(
        () => getIconBack(
          color: ConfigStore.to.state.isDarkMode
              ? LightColor.scaffoldBackground
              : DarkColor.scaffoldBackground,
        ),
      ),
      onPressed: _onPressed,
    ),
    actions: actions,
  );
}
