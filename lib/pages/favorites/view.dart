import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/style/colors.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/favorites/library.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var header = MyAppBar(
      isShowLine: true,
      left: MyButton.back(),
      center: const MyText('收藏夹'),
    );

    var body = Obx(() {
      var listChildren = controller.state.history.value.list
          .map((e) => MediaHot(resourceData: e))
          .toList();

      var loadingChildren = [const SizedBox(height: 20), MyIcons.loading()];

      var noDataChildren = [
        const SizedBox(height: 20),
        MyIcons.error(),
        const SizedBox(height: 10),
        const MyText(
          '暂无数据',
          textAlign: TextAlign.center,
          color: MyColors.secondText,
        )
      ];

      var children = controller.state.isLoading
          ? loadingChildren
          : controller.state.isRetry
              ? [MyButton.retry(onTap: controller.getResourceData)]
              : controller.state.history.value.list.isEmpty
                  ? noDataChildren
                  : listChildren;

      var listView = MyListView(
        children: children,
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      );

      return SafeArea(child: listView, top: false);
    });

    return MyScaffold(
      header: header,
      body: body,
    );
  }
}
