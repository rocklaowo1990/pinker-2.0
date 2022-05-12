import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/pages/application/home/library.dart';

class HomeController extends GetxController {
  final state = HomeState();
  final pageController = PageController();
  final scrollController = ScrollController();

  void pageChanged(index) {
    state.pageIndex = index;
    state.opacity = 0;
  }

  @override
  void onReady() {
    super.onReady();

    scrollController.addListener(() {
      state.opacity = scrollController.offset.toInt();
      if (state.opacity > 200) state.opacity = 200;
    });
  }
}
