import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/pages/phone/library.dart';

import '../../common/widgets/library.dart';

class PhoneView extends GetView<PhoneController> {
  const PhoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var header = MyAppBar(
      isShowLine: true,
      left: MyButton.back(),
      center: const MyText('手机'),
    );

    var body = Padding(
      padding: const EdgeInsets.all(16),
      child: Container(),
    );

    return MyScaffold(header: header, body: body);
  }
}
