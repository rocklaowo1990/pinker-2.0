import 'package:flutter/material.dart';
import 'package:pinker/common/widgets/library.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    Key? key,
    this.width = double.infinity,
    this.height = 50,
    this.isAnimation = true,
    this.onTap,
    this.child,
  }) : super(key: key);

  final double width;
  final double height;
  final bool isAnimation;
  final void Function()? onTap;
  final Widget? child;

  /// 返回按钮
  static Widget back({void Function()? onTap}) {
    return MyButton(onTap: onTap, width: 100, child: MyIcons.back());
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

  void _onTap() {
    if (widget.onTap != null) {
      controller.reverse();
      widget.onTap!();

      setState(() => isEnable = true);

      Future.delayed(const Duration(milliseconds: 500), () {
        controller.forward();
        setState(() => isEnable = false);
      });
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
    var decoration = const BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );

    var less = Container(
      width: widget.width,
      height: widget.height,
      decoration: decoration,
      clipBehavior: Clip.antiAlias,
      child: Center(child: widget.child),
    );

    var ful = FadeTransition(
      opacity: controller,
      child: less,
    );

    var body = GestureDetector(
      onTap: isEnable ? null : _onTap,
      onTapDown: isEnable ? null : _onTapDown,
      onTapCancel: _onTapCancel,
      child: widget.isAnimation ? ful : less,
    );

    return body;
  }
}
