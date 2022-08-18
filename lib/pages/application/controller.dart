import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pinker/common/global/library.dart';

import 'package:pinker/pages/application/community/library.dart';
import 'package:pinker/pages/application/home/library.dart';
import 'package:pinker/pages/application/library.dart';
import 'package:pinker/pages/application/my/library.dart';
import 'package:pinker/pages/application/short/library.dart';

class ApplicationController extends GetxController {
  final state = ApplicationState();
  final shortList = ResourceController.to.shortList;
  int pageIndex = 0;

  bool isPlay = false;

  var pageController = PageController();

  void onPageChanged(int index) async {
    pageIndex = index;
    final ShortController shortController = Get.find();

    if (index != 2) {
      if (shortController.videoPlayerController != null) {
        await shortController.videoPlayerController!.dispose();
        shortController.videoPlayerController = null;
        if (shortController.chewieController != null) {
          shortController.chewieController!.dispose();
          shortController.chewieController = null;
        }
      }
    } else {
      await shortController.videoPlay(
        shortList.value.list[shortController.pageIndex].shortUrl!,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CommunityController>(() => CommunityController());
    Get.lazyPut<ShortController>(() => ShortController());
    Get.lazyPut<MyController>(() => MyController());
  }
}
