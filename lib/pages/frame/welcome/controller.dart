import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/utils/library.dart';
import 'package:pinker/pages/frame/library.dart';
import 'package:pinker/pages/frame/sign_in/library.dart';
import 'package:pinker/pages/frame/sign_up/library.dart';

import 'package:pinker/pages/frame/welcome/library.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();
  final FrameController frameController = Get.find();

  void handleSignIn() async {
    frameController.state.pageIndex++;
    frameController.children.add(const SignInView());
    await futureMill(200);
    frameController.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void handleSignUp() async {
    frameController.state.pageIndex++;
    frameController.children.add(const SignUpView());
    await futureMill(200);
    frameController.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
