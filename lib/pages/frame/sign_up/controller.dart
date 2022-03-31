import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/utils/library.dart';
import 'package:pinker/pages/frame/library.dart';

import 'package:pinker/pages/frame/sign_up/library.dart';

class SignUpController extends GetxController {
  final state = SignUpState();
  final FrameController frameController = Get.find();
  final countController = TextEditingController();
  final countFocusNode = FocusNode();

  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  @override
  void onReady() async {
    super.onReady();
    await MyTimer.futureMill(200);
    countFocusNode.requestFocus();
  }
}
