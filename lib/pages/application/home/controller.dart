import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/routes/library.dart';
import 'package:pinker/pages/application/home/cartoon/library.dart';
import 'package:pinker/pages/application/home/drama/library.dart';
import 'package:pinker/pages/application/home/library.dart';
import 'package:pinker/pages/application/home/movie/library.dart';
import 'package:pinker/pages/application/home/sex/library.dart';
import 'package:pinker/pages/application/home/show/library.dart';

class HomeController extends GetxController {
  final state = HomeState();
  final pageController = PageController();
  final scrollController = ScrollController();

  void pageChanged(index) async {
    state.pageIndex = index;
    state.opacity = 0.0;
  }

  void search() {
    Get.toNamed(MyRoutes.search);
  }

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut<MovieController>(() => MovieController());
    Get.lazyPut<DramaController>(() => DramaController());
    Get.lazyPut<CartoomController>(() => CartoomController());
    Get.lazyPut<SexController>(() => SexController());
    Get.lazyPut<ShowController>(() => ShowController());
  }

  @override
  void onReady() {
    super.onReady();
    scrollController.addListener(() async {
      state.opacity = scrollController.offset / 10;
      if (state.opacity > 1.0) state.opacity = 1.0;
      if (state.opacity < 0.0) state.opacity = 0.0;
    });
  }
}
