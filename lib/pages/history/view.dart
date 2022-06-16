import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/history/library.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var header = MyAppBar(
      isShowLine: true,
      left: MyButton.back(),
      center: const MyText('观看历史'),
    );

    var hotColumnChildren =
        controller.state.history.map((e) => MediaHot(resourceData: e)).toList();

    var bodyChild = MyListView(
      children: hotColumnChildren,
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
    );

    var body = SafeArea(child: bodyChild, top: false);

    return MyScaffold(
      header: header,
      body: body,
    );
  }
}
