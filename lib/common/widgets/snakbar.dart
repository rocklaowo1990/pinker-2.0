import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/utils/library.dart';
import 'package:pinker/common/widgets/text.dart';

/// 顶部弹窗封装，文字版
///
/// 消息提示默认展示纯文本信息
Future<SnackbarController> getSnackbar({
  required String title,
  required String message,
  bool? isError,
}) async {
  // 初始化默认值
  isError ??= true;

  // 因为是懒加载，所以要等页面加载完再展示，页面动画一般是300ms，这里等待500ms
  await futureMill(500);

  // 返回一个snackbar
  return Get.snackbar(
    title,
    message,
    titleText: getText(title, fontSize: 17),
    messageText: getText(message),
    icon: Icon(
      isError ? Icons.error : Icons.check_circle,
      color: isError ? Colors.red : Colors.green,
    ),
  );
}
