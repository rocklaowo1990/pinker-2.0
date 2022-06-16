import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinker/pages/application/home/cartoon/library.dart';
import 'package:pinker/pages/application/home/library.dart';

class CartoomController extends GetxController {
  final state = CartoomState();

  final HomeController homeController = Get.find();
  final pageController = PageController();

  void onPageChanged(int index) => state.pageIndex = index;
}
