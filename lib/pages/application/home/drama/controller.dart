import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinker/pages/application/home/drama/library.dart';
import 'package:pinker/pages/application/home/library.dart';

class DramaController extends GetxController {
  final state = DramaState();
  final HomeController homeController = Get.find();

  final pageController = PageController();

  void onPageChanged(int index) => state.pageIndex = index;
}
