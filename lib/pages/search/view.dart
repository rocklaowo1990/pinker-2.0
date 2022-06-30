import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/search/library.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = controller.state;

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
      ///
      ///
      /// 历史记录的标题组成
      const spacer = Spacer();
      const historyTitle = Opacity(opacity: 0.5, child: MyText('最近搜索'));
      var buttonClose = MyButton.close(onTap: controller.showClear, size: 18);
      var historyHeaderChildren = [historyTitle, spacer, buttonClose];

      /// 搜索历史的标题
      var historyHeader = Row(children: historyHeaderChildren);

      /// 搜索历史组建方法
      Widget historyitemBuilder(BuildContext context, int index) {
        void _onTap() {
          controller.history(index);
        }

        return MyButton.history(text: state.history[index], onTap: _onTap);
      }

      var historyListView = ListView.separated(
        itemBuilder: historyitemBuilder,
        itemCount: state.history.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
      );

      /// 搜索历史记录
      var historyListViewSize = SizedBox(
        child: historyListView,
        height: 34,
      );

      /// 热门搜索的标题
      const hotTitle = Opacity(opacity: 0.5, child: MyText('热门搜索'));

      /// 加载按钮
      var loadingBox = Padding(
        padding: const EdgeInsets.only(top: 20),
        child: MyIcons.loading(),
      );

      /// 有搜索结果的组件放这里
      /// 未搜索状态
      /// 搜索结果
      /// 热门搜索
      /// 获取热门搜索结果的组装方法
      var resaultChildren = state.resault.value.list
          .map((e) => MediaSearch(resourceData: e))
          .toList();

      /// 一共有三个状态
      /// 1、刚进来的时候，会展示搜索就（如果有的话）和 热门搜索（如果加载失败展示重试）
      /// 2、搜索的时候，先展示加载按钮
      /// 3、拿到数据后，展示搜索结果
      /// 4、加载失败的话，展示网络连接的重试按钮

      void getHotList() async {
        await controller.getHotList();
      }

      var noDataChildren = [
        if (state.history.isNotEmpty) historyHeader,
        if (state.history.isNotEmpty) const SizedBox(height: 16),
        if (state.history.isNotEmpty) historyListViewSize,
        if (state.history.isNotEmpty) const SizedBox(height: 20),
        if (state.hot.value.list.isNotEmpty) hotTitle,
        if (state.hot.value.list.isNotEmpty) const SizedBox(height: 16),
        if (state.hot.value.list.isNotEmpty)
          for (var e in state.hot.value.list) MediaHot(resourceData: e),
        if (!state.isRetryHot && state.hot.value.list.isEmpty) loadingBox,
        if (state.isRetryHot && state.hot.value.list.isEmpty)
          MyButton.retry(onTap: getHotList),
      ];

      void search() {
        controller.search(controller.inputController.text);
      }

      var children = state.isShowLoading
          ? [loadingBox]
          : state.isShowResault
              ? state.isRetryResault
                  ? [MyButton.retry(onTap: search)]
                  : resaultChildren.isEmpty
                      ? [MyIcons.error()]
                      : resaultChildren
              : noDataChildren.isEmpty
                  ? [MyIcons.error()]
                  : noDataChildren;

      // var noResault = MyListView(children: noResaultChildren);

      return MyListView(
        children: children,
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
