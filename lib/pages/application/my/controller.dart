import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/routes/library.dart';
import 'package:pinker/pages/application/my/library.dart';

class MyController extends GetxController {
  final state = MyState();

  final scrollController = ScrollController();

  void history() => Get.toNamed(MyRoutes.history);

  void bank() => Get.toNamed(MyRoutes.bank);

  void phone() => Get.toNamed(MyRoutes.phone);

  @override
  void onReady() {
    super.onReady();
    scrollController.addListener(() {
      state.opacity = scrollController.offset / 10;
      state.scrollOffset = scrollController.offset;
      if (state.opacity > 1.0) state.opacity = 1.0;
      if (state.opacity < 0.0) state.opacity = 0.0;
    });
  }
}
