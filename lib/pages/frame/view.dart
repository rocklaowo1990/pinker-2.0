import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinker/common/store/library.dart';
import 'package:pinker/common/theme/library.dart';
import 'package:pinker/common/widgets/library.dart';

import 'package:pinker/pages/frame/library.dart';

class FrameView extends GetView<FrameController> {
  const FrameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// body
    var body = PageView(
      controller: controller.pageController,
      children: controller.children,
      physics: const NeverScrollableScrollPhysics(),
    );

    /// AppBar
    var appBar = getFrameAppBar(
      leading: Obx(
        () => AnimatedOpacity(
          opacity: controller.state.pageIndex > 0 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: getButton(
            child: getIconBack(
              color: ConfigStore.to.state.isDarkMode
                  ? LightColor.scaffoldBackground
                  : DarkColor.scaffoldBackground,
            ),
            onPressed: controller.state.pageIndex > 0
                ? controller.handleLeading
                : null,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
