import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/style/library.dart';
import 'package:pinker/common/utils/library.dart';
import 'package:pinker/common/widgets/library.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    Key? key,
    this.width,
    this.height,
    this.onTap,
    this.child,
    this.isRadius = true,
    this.color,
  }) : super(key: key);

  final double? width;
  final double? height;
  final void Function()? onTap;
  final Widget? child;
  final bool isRadius;
  final Color? color;

  /// 关闭按钮
  static MyButton close({void Function()? onTap, double? size}) {
    return MyButton(onTap: onTap, child: MyIcons.close(size: size));
  }

  /// 消息按钮
  static MyButton email({void Function()? onTap}) {
    return MyButton(onTap: onTap, child: MyIcons.emial());
  }

  /// 客服按钮
  static MyButton customer({void Function()? onTap}) {
    return MyButton(onTap: onTap, child: MyIcons.customer());
  }

  /// 我的页面哪些功能按钮的样式
  static MyButton my({
    required Widget icon,
    required String text,
    required void Function() onTap,
  }) {
    var children = [
      const SizedBox(height: 20),
      Expanded(child: icon),
      const SizedBox(height: 10),
      MyText(text),
      const SizedBox(height: 20),
    ];
    var child = Column(
      children: children,
      mainAxisAlignment: MainAxisAlignment.center,
    );
    return MyButton(
      onTap: onTap,
      child: child,
      width: (Get.width - 32 - 20) / 3,
      height: (Get.width - 32 - 20) / 3,
      color: MyColors.input,
    );
  }

  /// 搜索历史
  static Widget history({
    required String text,
    void Function()? onTap,
  }) {
    var buttonText = MyText(text);

    var buttonChild = Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: buttonText,
    );

    return MyButton(
      onTap: onTap,
      child: buttonChild,
      color: MyColors.input,
    );
  }

  /// 返回按钮
  static MyButton back({void Function()? onTap}) {
    void _onTap() => Get.back();
    return MyButton(
      onTap: onTap ?? _onTap,
      child: MyIcons.back(),
      width: 50,
    );
  }

  /// 网络连接失败后，重新连接的按钮
  static MyButton retry({void Function()? onTap}) {
    const errorText = MyText(
      '网络连接失败',
      textAlign: TextAlign.center,
      color: MyColors.secondText,
    );

    const retryText = MyText(
      '点击重试',
      textAlign: TextAlign.center,
      color: MyColors.secondText,
    );

    var noDataChildren = [
      const SizedBox(height: 20),
      MyIcons.retry(),
      const SizedBox(height: 10),
      errorText,
      retryText,
    ];

    return MyButton(
      onTap: onTap,
      child: Column(children: noDataChildren),
      width: 50,
    );
  }

  /// 长按钮
  static MyButton infinity(
    String data, {
    void Function()? onTap,
    bool? isAnimation,
  }) {
    const gradient = LinearGradient(
      colors: [Color.fromARGB(255, 46, 224, 30), Color(0xFF02be02)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    const decoration = BoxDecoration(gradient: gradient);

    var child = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: decoration,
      child: Center(child: MyText(data)),
    );

    return MyButton(
      onTap: onTap,
      width: double.infinity,
      height: 46,
      child: child,
    );
  }

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> with TickerProviderStateMixin {
  bool isEnable = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      value: 1.0,
      vsync: this,
      duration: const Duration(milliseconds: 100),
      reverseDuration: const Duration(milliseconds: 100),
      lowerBound: 0.7,
      upperBound: 1.0,
    );
  }

  void _onTap() async {
    if (widget.onTap != null) {
      await controller.reverse();
      setState(() => isEnable = true);
      widget.onTap!();

      await MyTimer.futureMill(500);
      await controller.forward();
      if (mounted) setState(() => isEnable = false);
    }
  }

  void _onTapDown(value) {
    if (widget.onTap != null) {
      controller.reverse();
    }
  }

  void _onTapCancel() {
    Future.delayed(const Duration(milliseconds: 500), () {
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    var decoration = BoxDecoration(
      borderRadius: widget.isRadius ? MyStyle.borderRadius : BorderRadius.zero,
      color: widget.color,
      shape: BoxShape.rectangle,
    );

    var less = Container(
      width: widget.width,
      height: widget.height,
      decoration: decoration,
      clipBehavior: Clip.antiAlias,
      child: Center(child: widget.child),
    );

    var child = FadeTransition(
      opacity: controller,
      child: less,
    );

    return GestureDetector(
      onTap: isEnable ? null : _onTap,
      onTapDown: isEnable ? null : _onTapDown,
      onTapCancel: _onTapCancel,
      child: child,
    );
  }
}
