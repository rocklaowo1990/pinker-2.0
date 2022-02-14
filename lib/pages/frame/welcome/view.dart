import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:pinker_project/pages/frame/welcome/library.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var body = Container(
      color: Colors.red,
    );
    return Scaffold(
      body: body,
    );
  }
}
