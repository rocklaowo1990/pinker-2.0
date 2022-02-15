import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:pinker_project/pages/frame/sign_up/library.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  SignUpController get controller => Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    var body = Container(
      color: Colors.green,
    );
    return Scaffold(
      body: body,
    );
  }
}
