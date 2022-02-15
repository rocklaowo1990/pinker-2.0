import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker_project/common/utils/library.dart';
import 'package:pinker_project/pages/frame/library.dart';
import 'package:pinker_project/pages/frame/sign_in/library.dart';
import 'package:pinker_project/pages/frame/sign_up/library.dart';

import 'package:pinker_project/pages/frame/welcome/library.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();
  final FrameController frameController = Get.find();

  void handleSignIn() async {
    frameController.children.add(const SignInView());
    frameController.state.pageIndex++;
    await futureMill(200);
    frameController.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void handleSignUp() async {
    frameController.children.add(const SignUpView());
    frameController.state.pageIndex++;
    await futureMill(200);
    frameController.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
