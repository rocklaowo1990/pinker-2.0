import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/pages/application/home/library.dart';
import 'package:pinker/pages/application/home/show/library.dart';

class ShowController extends GetxController {
  final state = ShowState();

  final HomeController homeController = Get.find();

  final pageController = PageController();

  void onPageChanged(int index) => state.pageIndex = index;
}
