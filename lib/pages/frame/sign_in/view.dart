import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:pinker/pages/frame/sign_in/library.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);

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
