import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/pages/add_usdt/library.dart';

import '../../common/widgets/library.dart';

class AddUsdtView extends GetView<AddUsdtController> {
  const AddUsdtView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var header = MyAppBar(
      isShowLine: true,
      left: MyButton.back(),
      center: const MyText('添加 USDT-TRC'),
    );

    var bodyChildren = [
      MyText.gray14('请认真核对 USDT-TRC20 或 USDT-TRC 的收款地址'),
      const SizedBox(height: 20),
      MyInput(
        controller: controller.inputController,
        focusNode: controller.inputFocusNode,
        hintText: '输入或粘贴您的链地址',
        maxLines: 16,
        height: 100,
        contentPadding: const EdgeInsets.all(16),
      ),
      const SizedBox(height: 32),
      MyButton.infinity('提交'),
    ];

    var bodyChild = Column(children: bodyChildren);

    var body = Padding(
      padding: const EdgeInsets.all(16),
      child: bodyChild,
    );

    return MyScaffold(header: header, body: body);
  }
}
