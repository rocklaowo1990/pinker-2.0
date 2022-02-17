import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinker/pages/frame/sign_up/library.dart';

class SignUpController extends GetxController {
  final state = SignUpState();
  final countController = TextEditingController();
  final countFocusNode = FocusNode();

  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();
}
