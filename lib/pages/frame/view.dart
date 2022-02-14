import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinker_project/common/routes/library.dart';
import 'package:pinker_project/common/widgets/library.dart';

import 'package:pinker_project/pages/frame/library.dart';

class FrameView extends GetView<FrameController> {
  const FrameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var body = GetNavigator(
      key: Get.nestedKey(1),
      pages: AppPages.setPages,
      reportsRouteUpdateToEngine: true,
    );
    return Scaffold(
      appBar: getFrameAppBar(),
      body: body,
    );
  }
}
