import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 按钮封装
///
/// 基本上所有的按钮都可以用到
///
/// 这个按钮是全局的，任何按钮都可以调用该方法
Widget getButton({
  /// 按钮的点击事件
  VoidCallback? onPressed,

  /// 子组件
  required Widget child,

  /// 按钮高度
  double? height,

  /// 按钮宽度
  double? width,

  /// 按钮宽度
  BorderRadiusGeometry? borderRadius,

  /// 子组件对齐方式
  AlignmentGeometry alignment = Alignment.center,

  /// padding
  EdgeInsetsGeometry padding = EdgeInsets.zero,

  /// 边框
  BorderSide? borderSide,
}) {
  /// 按钮的填充大小，表示的是按钮的总大小
  MaterialStateProperty<Size?>? fixedSize;
  if (width != null && height != null) {
    fixedSize = MaterialStateProperty.all(Size(width, height));
  } else if (width != null) {
    fixedSize = MaterialStateProperty.all(Size.fromWidth(width));
  } else if (height != null) {
    fixedSize = MaterialStateProperty.all(Size.fromHeight(height));
  }

  /// 按钮点击一次后会重置为禁用状态，防止重复点击
  final enable = true.obs;
  if (onPressed != null) enable.value = false;

  return Obx(
    () => TextButton(
      clipBehavior: Clip.hardEdge,
      onPressed: !enable.value
          ? () {
              if (onPressed != null) onPressed();
              enable.value = true;
              Future.delayed(const Duration(seconds: 1), () {
                enable.value = false;
              });
            }
          : null,
      style: ButtonStyle(
        /// 对其方式，默认居中对齐
        alignment: alignment,

        /// 这里是设置按钮的大小，高度和宽度
        fixedSize: fixedSize,

        /// 按钮的最小大小：最小可以是 0 ，看不到
        minimumSize: MaterialStateProperty.all(Size.zero),

        /// 响应触摸的区域: 这里是表示收缩后的空间，表示按钮不需要多余的空间
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,

        /// 按钮文字样式
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontWeight: FontWeight.normal),
        ),

        /// 按钮圆角
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(Get.width),
          ),
        ),

        /// 按钮的边框，这个好理解
        side: borderSide == null ? null : MaterialStateProperty.all(borderSide),

        /// 清空按钮的padding
        padding: MaterialStateProperty.all(padding),

        /// 按钮背景色，默认主色
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: child,
    ),
  );
}
