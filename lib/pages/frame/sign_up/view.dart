import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:pinker/common/lang/translation_service.dart';
import 'package:pinker/common/widgets/library.dart';

import 'package:pinker/pages/frame/sign_up/library.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var count = getTextField(
      type: Lang.count.tr,
      controller: controller.countController,
      focusNode: controller.countFocusNode,
    );
    var password = getTextField(
      type: Lang.password.tr,
      controller: controller.passwordController,
      focusNode: controller.passwordFocusNode,
    );
    var top = Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          count,
          const SizedBox(height: 10),
          password,
        ],
      ),
    );
    var bottom = Container(
      height: 50,
      color: Colors.red,
      width: double.infinity,
    );
    var body = Column(
      children: [
        top,
        const Spacer(),
        bottom,
      ],
    );
    return Scaffold(
      body: body,
    );
  }
}
