import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/style/library.dart';
import 'package:pinker/common/widgets/library.dart';

class AlertCenter extends StatelessWidget {
  const AlertCenter({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  static Widget alert({
    required String title,
    required String content,
    void Function()? onTap,
  }) {
    void back() => Get.back();

    var titleBox = MyText.text20(title);

    var contentBox = MyText(content);

    var cancelButton = MyButton(
      width: double.infinity,
      height: 50,
      onTap: back,
      child: const MyText('取消'),
    );

    var sureButton = MyButton(
      width: double.infinity,
      height: 50,
      child: MyText.primary('确认'),
      onTap: onTap,
    );

    var contentBody = Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 40, left: 20, right: 20),
      child: Column(
        children: [titleBox, const SizedBox(height: 20), contentBox],
      ),
    );

    var buttons = Row(
      children: [
        Expanded(child: cancelButton),
        Container(width: 1, height: 32, color: MyColors.input),
        Expanded(child: sureButton),
      ],
    );

    var body = Column(
      children: [
        contentBody,
        Container(height: 1, color: MyColors.input),
        buttons,
      ],
    );

    return Container(
      child: body,
      width: Get.width - 80,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: MyColors.appBar,
        borderRadius: MyStyle.borderRadius,
        shape: BoxShape.rectangle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void back() => Get.back();

    var button = MyButton(
      width: Get.width,
      height: Get.height,
      onTap: back,
    );

    var body = SizedBox(
      width: Get.width,
      height: Get.height,
      child: Column(children: [const Spacer(), child, const Spacer()]),
    );

    return Material(
      child: Stack(children: [button, body]),
      color: MyColors.background20,
    );
  }
}
