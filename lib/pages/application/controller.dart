import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pinker/common/global/library.dart';

import 'package:pinker/pages/application/community/library.dart';
import 'package:pinker/pages/application/home/library.dart';
import 'package:pinker/pages/application/library.dart';
import 'package:pinker/pages/application/my/library.dart';
import 'package:pinker/pages/application/short/library.dart';
import 'package:wakelock/wakelock.dart';

class ApplicationController extends GetxController {
  final state = ApplicationState();
  final shortList = ResourceController.to.shortList;

  bool isPlay = false;

  var pageController = PageController();

  void onPageChanged(int index) async {
    final ShortController shortController = Get.find();

    if (index != 2) {
      if (isPlay) {
        await shortController.videoPlayerController.pause();
        isPlay = false;
        Wakelock.disable();
      }
    } else {
      await shortController.videoPlay(
        shortList.value.list[shortController.pageIndex].shortUrl!,
        isReset: false,
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
