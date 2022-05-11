import 'package:flutter/material.dart';
import 'package:pinker/common/theme/library.dart';
import 'package:pinker/common/utils/library.dart';
import 'package:pinker/common/widgets/library.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    Key? key,
    this.width,
    this.height,
    this.isAnimation = true,
    this.onTap,
    this.child,
  }) : super(key: key);

  final double? width;
  final double? height;
  final bool isAnimation;
  final void Function()? onTap;
  final Widget? child;

  /// 返回按钮
  static Widget back({void Function()? onTap}) {
    return MyButton(onTap: onTap, width: 100, child: MyIcons.back());
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
      child: Center(child: MyText(data, colors: const [Colors.white])),
    );

    return MyButton(
      onTap: onTap,
      width: double.infinity,
      height: 50,
      child: child,
      isAnimation: isAnimation ?? false,
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
      if (widget.isAnimation) {
        await MyTimer.futureMill(500);
        if (mounted) {
          await controller.forward();
          setState(() => isEnable = false);
        }
      }
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
      borderRadius: MyTheme.borderRadius,
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

    var build = GestureDetector(
      onTap: isEnable ? null : _onTap,
      onTapDown: isEnable ? null : _onTapDown,
      onTapCancel: _onTapCancel,
      child: child,
    );

    return build;
  }
}
