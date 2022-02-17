import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/utils/library.dart';
import 'package:pinker/pages/frame/library.dart';
import 'package:pinker/pages/frame/welcome/view.dart';

class FrameController extends GetxController {
  final state = FrameState();
  final pageController = PageController();

  var children = <Widget>[
    const WelcomeView(),
  ];

  void handleLeading(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    await futureMill(200);
    if (state.pageIndex > 0) state.pageIndex--;
    Get.back(id: 1);
  }
}
