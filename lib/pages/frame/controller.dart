import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/pages/frame/library.dart';
import 'package:pinker/pages/frame/welcome/view.dart';

class FrameController extends GetxController {
  final state = FrameState();
  final pageController = PageController();

  var children = <Widget>[
    const WelcomeView(),
  ];

  void handleLeading() {
    if (state.pageIndex > 0) state.pageIndex--;
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    children.removeLast();
  }
}
