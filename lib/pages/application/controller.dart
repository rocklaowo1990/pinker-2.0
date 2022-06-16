import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pinker/pages/application/act/library.dart';
import 'package:pinker/pages/application/community/library.dart';
import 'package:pinker/pages/application/home/library.dart';
import 'package:pinker/pages/application/library.dart';
import 'package:pinker/pages/application/my/library.dart';

class ApplicationController extends GetxController {
  final state = ApplicationState();

  var pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CommunityController>(() => CommunityController());
    Get.lazyPut<ActController>(() => ActController());
    Get.lazyPut<MyController>(() => MyController());
  }
}
