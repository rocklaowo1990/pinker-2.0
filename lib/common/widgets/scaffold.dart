import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/global/library.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    Key? key,
    this.header,
    this.body,
    this.footer,
    this.background,
  }) : super(key: key);

  final Widget? header;
  final Widget? body;
  final Widget? footer;
  final Widget? background;

  @override
  Widget build(BuildContext context) {
    /// 默认的页面背景：黑白颜色交替
    Widget obxBuild() {
      const darkBac = Color(0XFF0E0E11);
      const lightBac = Color(0XFFCCCCCC);
      var color = ConfigStore.to.isLightMode ? lightBac : darkBac;
      return Container(color: color);
    }

    /// 页面背景:默认是黑白交替的颜色
    var backgroundColor = Obx(obxBuild);

    /// AppBar和Body的组合成员
    var headerAndBodyChildren = [
      if (header != null) header!,
      if (body != null) Expanded(child: body!),
    ];
    var headerAndBody = Column(children: headerAndBodyChildren);

    /// AppBar，Body 和 Footer的组合成员
    var bodyChildren = [
      if (headerAndBodyChildren.isNotEmpty) Expanded(child: headerAndBody),
      if (footer != null) footer!,
    ];
    var bodyWidget = Column(
      children: bodyChildren,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );

    /// 页面的背景和Body的组成方式
    var stackChildren = [background ?? backgroundColor, bodyWidget];
    var stack = Stack(children: stackChildren);

    /// 根据参数返回页面的形态
    /// 如果有AppBar或者Body或者是Fotter里的任何一个则返回stack
    /// 如果都没有就返回页面背景
    return Material(child: stack);
  }
}
