import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:pinker/pages/application/home/library.dart';
import 'package:pinker/pages/application/home/movie/library.dart';

class MovieController extends GetxController {
  final state = MovieState();
  final HomeController homeController = Get.find();
  final pageController = PageController();

  void onPageChanged(int index) => state.pageIndex = index;
}
