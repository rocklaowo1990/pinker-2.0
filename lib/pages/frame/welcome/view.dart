import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinker_project/common/lang/translation_service.dart';
import 'package:pinker_project/common/theme/colors.dart';
import 'package:pinker_project/common/widgets/library.dart';
import 'package:pinker_project/common/widgets/text.dart';

import 'package:pinker_project/pages/frame/welcome/library.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  WelcomeController get controller => Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    /// 标题和注册按钮
    var signUp = Column(
      children: [
        getWelcomeTile(Lang.welcomeTitle.tr),
        const SizedBox(height: 20),
        getInfinityButton(Lang.welcomeGoSignUp.tr,
            onPressed: controller.handleSignUp),
      ],
    );

    /// 登陆按钮
    var signIn = Row(
      children: [
        getText(Lang.welcomeHint.tr),
        getButton(
          padding: const EdgeInsets.all(8),
          child:
              getText(Lang.welcomeGoSignIn.tr, color: AppColors.primaryColor),
          onPressed: controller.handleSignIn,
        ),
      ],
    );

    /// 主体布局
    var padding = Padding(
      padding: EdgeInsets.fromLTRB(Get.width * 0.12, 0, Get.width * 0.12, 64),
      child: Column(
        children: [
          const SizedBox(),
          const Spacer(),
          signUp,
          const Spacer(),
          signIn,
        ],
      ),
    );

    /// body：需要判断遮罩层什么时候现实
    var body = Obx(
      () => controller.frameController.state.pageIndex != 0
          ? Stack(
              children: [
                padding,
                Container(
                  color: Colors.black12,
                ),
              ],
            )
          : padding,
    );
    return Scaffold(
      body: body,
    );
  }
}
