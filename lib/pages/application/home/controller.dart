import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/pages/application/home/aldult/library.dart';
import 'package:pinker/pages/application/home/cartoon/library.dart';
import 'package:pinker/pages/application/home/drama/library.dart';

import 'package:pinker/pages/application/home/library.dart';
import 'package:pinker/pages/application/home/movie/library.dart';
import 'package:pinker/pages/application/home/show/library.dart';

class HomeController extends GetxController {
  final state = HomeState();
  final pageController = PageController();
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut<MovieController>(() => MovieController());
    Get.lazyPut<DramaController>(() => DramaController());
    Get.lazyPut<CartoomController>(() => CartoomController());
    Get.lazyPut<AldultController>(() => AldultController());
    Get.lazyPut<ShowController>(() => ShowController());
  }

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
