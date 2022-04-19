import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/lang/library.dart';
import 'package:pinker/common/theme/library.dart';
import 'package:pinker/common/widgets/library.dart';

class MyTextField extends TextField {
  const MyTextField({Key? key}) : super(key: key);
}

Widget getTextField({
  /// 键盘的类型
  required String type,

  /// 控制器
  required TextEditingController controller,

  /// 焦点
  required FocusNode focusNode,

  /// 键盘右下角的按钮类型
  TextInputAction? textInputAction,

  /// 左侧按钮
  Widget? prefixIcon,

  /// 输入框宽度
  double? width,

  /// 输入框高度
  double? height,

  /// padding
  EdgeInsetsGeometry? contentPadding,

  /// radius
  BorderRadius? borderRadius,

  /// 键盘确认时间
  void Function(String)? onSubmitted,

  /// 最大行
  int? maxLines = 1,
}) {
  /// 判断是否显示密码
  final isPassword = false.obs;

  /// 根据不同的类型给予不同的键盘类型
  var keyboardType = TextInputType.emailAddress;

  /// 右侧按钮状态管理
  final textObs = controller.text.obs;

  /// 右侧按钮图标
  final suffixIcon = Icons.cancel.obs;

  /// 右侧按钮点击事件
  void Function()? onPressed;

  /// 显示密码 和 隐藏密码
  void passwordText() {
    isPassword.value = !isPassword.value;
    focusNode.requestFocus();
    suffixIcon.value =
        isPassword.value ? Icons.visibility_off : Icons.visibility;
  }

  /// 文本改变事件
  void onChanged(String value) {
    textObs.value = value;
  }

  /// 文本改变监听
  controller.addListener(() {
    textObs.value = controller.text;
  });

  /// 清除文本
  onPressed = () {
    controller.clear();
    textObs.value = controller.text;
    focusNode.requestFocus();
  };

  /// 根据不同的类型 初始化
  if (RegExp(r"密码|Password").hasMatch(type)) {
    onPressed = passwordText;
    isPassword.value = true;
    keyboardType = TextInputType.visiblePassword;
    suffixIcon.value = Icons.visibility_off;
  } else if (type == Lang.phone.tr || RegExp(r"数量|Number").hasMatch(type)) {
    keyboardType = TextInputType.number;
  } else if (type == Lang.email.tr) {
    keyboardType = TextInputType.emailAddress;
  } else if (RegExp(r"新鲜事|News").hasMatch(type)) {
    keyboardType = TextInputType.multiline;
  }

  /// 组件
  return Obx(
    () => Container(
      clipBehavior:
          borderRadius == BorderRadius.zero ? Clip.hardEdge : Clip.antiAlias,
      child: Center(
        child: TextField(
          textInputAction: textInputAction,
          focusNode: focusNode,
          controller: controller,
          onSubmitted: onSubmitted,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: textObs.value.isEmpty
                ? null
                : MyButton.back(
                    onTap: onPressed,
                  ),
            contentPadding: contentPadding ?? const EdgeInsets.only(left: 20),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            hintText: type,
            hintStyle: const TextStyle(
              fontSize: 14,
            ),
          ),
          obscureText: isPassword.value,
          onChanged: onChanged,
        ),
      ),
      width: width ?? Get.width,
      height: height ?? Get.width * 0.12,
      decoration: BoxDecoration(
        borderRadius:
            borderRadius ?? BorderRadius.all(Radius.circular(Get.width)),
        color: ConfigStore.to.isDarkMode
            ? AppColors.primaryBackgroundDark
            : AppColors.primaryBackgroundLight,
      ),
    ),
  );
}

Widget getTextFieldSearch(
  TextEditingController controller,
  FocusNode focusNode, {
  BorderRadius? borderRadius,
  // Widget? prefixIcon,
  void Function(String)? onSubmitted,
}) {
  return getTextField(
    height: Get.width * 0.12,
    contentPadding: const EdgeInsets.only(left: 20),
    type: Lang.search.tr,
    controller: controller,
    focusNode: focusNode,
    borderRadius: borderRadius,
    onSubmitted: onSubmitted,
    textInputAction: TextInputAction.search,
    prefixIcon: SizedBox(
      width: 10,
      height: 10,
      child: Center(
        child: SvgPicture.asset(
          'assets/svg/icon_search_2.svg',
        ),
      ),
    ),
  );
}
