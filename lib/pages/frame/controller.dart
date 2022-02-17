import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/routes/library.dart';
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
    if (state.pageIndex > 0) state.pageIndex--;
    FocusScope.of(context).requestFocus(FocusNode());
    await futureMill(200);
    Get.back(id: 1);
  }

  void handleSet(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    await futureMill(200);
    Get.toNamed(AppRoutes.set);
  }
}
