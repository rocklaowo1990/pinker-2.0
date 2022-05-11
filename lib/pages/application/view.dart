import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinker/common/widgets/footer_bar.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/application/act/view.dart';
import 'package:pinker/pages/application/community/view.dart';
import 'package:pinker/pages/application/home/library.dart';

import 'package:pinker/pages/application/library.dart';
import 'package:pinker/pages/application/my/view.dart';

class ApplicationView extends GetView<ApplicationController> {
  const ApplicationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const pageChildren = [
      HomeView(),
      CommunityView(),
      ActView(),
      MyView(),
    ];
    var pageView = PageView(
      controller: controller.pageController,
      children: pageChildren,
      physics: const NeverScrollableScrollPhysics(),
      allowImplicitScrolling: true,
    );

    return MyScaffold(
      body: pageView,
      footer: MyFooterBar(pageController: controller.pageController),
    );
  }
}
