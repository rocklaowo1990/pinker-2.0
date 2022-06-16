import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/style/colors.dart';
import 'package:pinker/pages/bank/library.dart';

import '../../common/widgets/library.dart';

class BankView extends GetView<BankController> {
  const BankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var header = MyAppBar(
      isShowLine: true,
      left: MyButton.back(),
      center: const MyText('银行卡管理'),
    );

    Widget empty(String text, {void Function()? onTap}) {
      const icon = Icon(Icons.add_circle, color: MyColors.secondText);
      const spacer = SizedBox(width: 10);
      var textBox = MyText.gray16(text);

      var child = Row(
        children: [icon, spacer, textBox],
        mainAxisAlignment: MainAxisAlignment.center,
      );

      return MyButton(
        width: Get.width - 32,
        height: 120,
        color: MyColors.appBar,
        child: child,
        onTap: onTap,
      );
    }

    var body = Column(
      children: [
        const SizedBox(height: 16),
        empty('添加银行卡', onTap: controller.addBank),
        const SizedBox(height: 16),
        empty('USDT-TRC', onTap: controller.addUsdt),
      ],
    );

    return MyScaffold(
      header: header,
      body: body,
    );
  }
}
