import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinker_project/common/widgets/library.dart';
import 'package:pinker_project/pages/set/library.dart';

class SetView extends GetView<SetController> {
  const SetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = getButton(
      child: const Text('更改主题'),
      onPressed: controller.handleSetTheme,
    );
    var lang = getButton(
      child: const Text('更改语言'),
      onPressed: controller.handleSetLang,
    );

    var body = Column(
      children: [
        const SizedBox(height: 10),
        Center(child: theme),
        const SizedBox(height: 10),
        lang,
      ],
    );

    return Scaffold(
      appBar: getAppBar(title: '设置'),
      body: body,
    );
  }
}
