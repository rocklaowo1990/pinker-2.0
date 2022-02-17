import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinker/common/class/library.dart';
import 'package:pinker/common/routes/library.dart';

import 'package:pinker/common/widgets/library.dart';

import 'package:pinker/pages/frame/library.dart';

class FrameView extends GetView<FrameController> {
  const FrameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// body
    var body = GetNavigator(
      key: Get.nestedKey(1),
      pages: [AppPages.framePages],
    );

    /// AppBar
    var appBar = getFrameAppBar(
      leading: Obx(
        () => AnimatedOpacity(
          opacity: controller.state.pageIndex > 0 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: getButton(
            child: AppIcons.back,
            onPressed: controller.state.pageIndex > 0
                ? () {
                    controller.handleLeading(context);
                  }
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
