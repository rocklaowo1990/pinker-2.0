import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/initial/library.dart';

class InitialView extends GetView<InitialController> {
  const InitialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyScaffold();
  }
}
