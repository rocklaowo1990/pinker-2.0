import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/lang/translation_service.dart';
import 'package:pinker/common/theme/library.dart';

class MyInput extends StatelessWidget {
  const MyInput({
    Key? key,
    this.controller,
    this.focusNode,
    this.maxLines = 1,
    this.onSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.contentPadding = const EdgeInsets.only(left: 20),
    this.prefixIcon,
    this.suffixIcon,
    this.hintText = Lang.defaultHintText,
    this.obscureText = false,
    this.onChanged,
    this.width = double.infinity,
    this.height = 40,
    this.borderRadius = MyTheme.borderRadius,
    this.onTap,
  }) : super(key: key);

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  final int maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final String hintText;
  final bool obscureText;
  final void Function(String)? onChanged;
  final double width;
  final double height;
  final BorderRadiusGeometry borderRadius;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Widget obxBuild() {
      const dark = Color(0x50000000);
      const light = Color(0x50ffffff);
      TextStyle textStyle = TextStyle(
        fontSize: 14,
        color: ConfigStore.to.isLightMode ? dark : light,
      );
      var inputDecoration = InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        hintText: hintText.tr,
        hintStyle: textStyle,
      );
      var textField = TextField(
        textInputAction: textInputAction,
        focusNode: focusNode,
        controller: controller,
        onSubmitted: onSubmitted,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: inputDecoration,
        obscureText: obscureText,
        onChanged: onChanged,
        onTap: onTap,
      );
      var edge = Clip.hardEdge;
      var alias = Clip.antiAlias;
      var clipBehavior = borderRadius == BorderRadius.zero ? edge : alias;

      var boxDecoration = BoxDecoration(
        borderRadius: borderRadius,
        shape: BoxShape.rectangle,
        color: ConfigStore.to.isLightMode ? Colors.white : Colors.black,
      );
      return Container(
        child: textField,
        width: width,
        height: height,
        clipBehavior: clipBehavior,
        decoration: boxDecoration,
      );
    }

    return Obx(obxBuild);
  }
}
