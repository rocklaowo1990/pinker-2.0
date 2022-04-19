import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinker/common/widgets/library.dart';

import 'package:pinker/pages/application/library.dart';

class ApplicationView extends GetView<ApplicationController> {
  const ApplicationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(header: MyAppBar());
  }
}
