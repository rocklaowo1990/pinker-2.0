import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinker_project/common/lang/library.dart';
import 'package:pinker_project/common/widgets/text.dart';
import 'package:pinker_project/pages/initial/library.dart';

class InitialView extends GetView<InitialController> {
  const InitialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getText(Lang.edit.tr),
      ),
    );
  }
}
