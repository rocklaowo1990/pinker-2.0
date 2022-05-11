import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/application/my/library.dart';

class MyView extends GetView<MyController> {
  const MyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: MyButton(
        child: const MyText(
          'data',
          colors: [Colors.white],
        ),
        onTap: controller.onTap,
      ),
    );
  }
}
