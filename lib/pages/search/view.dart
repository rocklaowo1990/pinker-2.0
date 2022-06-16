import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/search/library.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _hot = ResourceController.to.hot;

    /// appBar
    /// 由一个返回按钮 和 一个搜索框组成
    /// 返回按钮
    /// 搜索框
    var buttonBack = MyButton.back();

    var searchInput = MyInput(
      controller: controller.inputController,
      focusNode: controller.inputFocusNode,
      prefixIcon: MyIcons.search(),
      height: 35,
      textInputAction: TextInputAction.search,
      hintText: ResourceController.to.searchWord,
      onSubmitted: controller.search,
    );

    const appBarRight = SizedBox(width: 16);

    var rowChildren = [buttonBack, Expanded(child: searchInput), appBarRight];

    var appBarChild = Row(children: rowChildren);

    var header = MyAppBar(
      center: appBarChild,
      isShowLine: true,
    );

    /// 获取历史记录组件的方法
    /// 页面组成
    /// 下面的方法是整个页面的刷新
    Widget bodyBuild() {
      /// 页面的主体部分
      /// 由未搜索页面 和 搜索结果两个不同的状态组成
      /// 未搜索状态的组件放这里：包含历史记录，热门搜索两个模块
      /// 历史记录
      const spacer = Spacer();

      const historyTitle = Opacity(opacity: 0.5, child: MyText('最近搜索'));

      var buttonClose = MyButton.close(onTap: controller.showClear);

      var historyHeaderChildren = [historyTitle, spacer, buttonClose];

      var historyHeader = Row(children: historyHeaderChildren);

      Widget historyitemBuilder(BuildContext context, int index) {
        void _onTap() {
          controller.history(index);
        }

        return MyButton.history(
            text: controller.state.history[index], onTap: _onTap);
      }

      var historyListView = ListView.separated(
        itemBuilder: historyitemBuilder,
        itemCount: controller.state.history.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
      );

      var historyListViewSize = SizedBox(
        child: historyListView,
        height: 34,
      );

      var historyChildren = [
        historyHeader,
        const SizedBox(height: 16),
        historyListViewSize,
      ];

      var history = Column(children: historyChildren);

      const hotTitle = Opacity(opacity: 0.5, child: MyText('热门搜索'));

      var hotColumnChildren =
          _hot.value.list.map((e) => MediaHot(resourceData: e)).toList();

      var hotColumn = Column(children: hotColumnChildren);

      var hot = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hotTitle,
          const SizedBox(height: 16),
          hotColumn,
        ],
      );

      var loadingBox = Padding(
        padding: const EdgeInsets.only(top: 20),
        child: MyIcons.loading(),
      );

      var hotBox = _hot.value.list.isNotEmpty ? hot : loadingBox;

      /// 没有搜索结果的组成
      var noResaultChildren = [
        if (controller.state.history.isNotEmpty) history,
        if (controller.state.history.isNotEmpty) const SizedBox(height: 20),
        hotBox,
      ];

      // var noResault = MyListView(children: noResaultChildren);

      /// 有搜索结果的组件放这里
      /// 未搜索状态
      /// 搜索结果
      /// 热门搜索
      /// 获取热门搜索结果的组装方法
      var haveResaultChildren = controller.state.resault.value.list
          .map((e) => MediaSearch(resourceData: e))
          .toList();

      return MyListView(
        children: controller.state.isShowLoading
            ? [loadingBox]
            : controller.state.resault.value.list.isEmpty
                ? noResaultChildren
                : haveResaultChildren,
        controller: controller.scrollController,
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      );
    }

    var body = Obx(bodyBuild);

    return MyScaffold(
      header: header,
      body: body,
    );
  }
}
