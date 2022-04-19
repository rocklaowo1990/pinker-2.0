import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinker/common/lang/library.dart';
import 'package:pinker/common/widgets/text.dart';
import 'package:pinker/pages/initial/library.dart';

class InitialView extends GetView<InitialController> {
  const InitialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(Lang.edit.tr),
      ),
    );
  }
}
