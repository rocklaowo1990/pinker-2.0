import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/lang/translation_service.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/welcome/library.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 标题和注册按钮
    var signUp = Column(
      children: [
        MyText.welcome(Lang.welcomeTitle.tr),
        const SizedBox(height: 20),
        MyButton.back(onTap: controller.handleSignUp)
      ],
    );

    /// 登陆按钮
    var signIn = SafeArea(
      child: Row(
        children: [
          MyText.title(Lang.welcomeHint.tr),
          MyButton.back(),
        ],
      ),
      top: false,
    );

    /// 主体布局
    var body = Padding(
      padding: EdgeInsets.fromLTRB(Get.width * 0.12, 0, Get.width * 0.12, 30),
      child: Column(
        children: [
          const SizedBox(),
          const Spacer(),
          signUp,
          MyIcons.back(),
          const Spacer(),
          signIn,
        ],
      ),
    );

    return MyScaffold(
      header: MyAppBar(
        isShowLine: true,
        right: Container(
          width: 100,
          color: Colors.blue,
        ),
        center: Container(
          color: Colors.pink,
          child: const Center(
            child: Text(
              'data',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: body,
    );
  }
}
