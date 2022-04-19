import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pinker/common/global/library.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    Key? key,
    this.header,
    this.body,
    this.footer,
  }) : super(key: key);

  final Widget? header;
  final Widget? body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    Widget obxBuild() {
      var color = ConfigStore.to.isDarkMode ? Colors.black : Colors.white;
      return Container(color: color);
    }

    /// 页面背景
    var background = Obx(() => obxBuild());

    var columnChildren = [
      if (header != null) header!,
      if (body != null) Expanded(child: body!),
      if (footer != null) footer!,
    ];

    var column = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: columnChildren,
    );

    var stackChildren = [background, column];

    var stack = Stack(children: stackChildren);

    return Material(child: stack);
  }
}
