import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/pages/application/home/library.dart';
import 'package:pinker/pages/application/home/sex/library.dart';

class SexController extends GetxController {
  final state = SexState();
  final HomeController homeController = Get.find();
  final pageController = PageController();

  void onPageChanged(int index) => state.pageIndex = index;
}
