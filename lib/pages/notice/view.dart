import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/notice/library.dart';

class NoticeView extends GetView<NoticeController> {
  const NoticeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// appbar
    var header = MyAppBar(
      isShowLine: true,
      center: MyText.text20('未知页面'),
      left: MyButton.back(),
    );

    /// 页面构成
    return MyScaffold(header: header);
  }
}
