import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/api/library.dart';
import 'package:pinker/common/constant/storage.dart';
import 'package:pinker/common/data/library.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/utils/library.dart';
import 'package:pinker/common/widgets/alert_center.dart';
import 'package:pinker/pages/search/library.dart';

class SearchController extends GetxController {
  final state = SearchState();

  final inputController = TextEditingController();
  final inputFocusNode = FocusNode();
  final scrollController = ScrollController();

  void history(int index) {
    /// 将内容放入输入框，并且把焦点置于文本末端
    // var textPosition = TextPosition(
    //   affinity: TextAffinity.downstream,
    //   offset: state.history[index].length,
    // );

    /// 焦点置于末端
    // inputController.value = TextEditingValue(
    //   text: state.history[index],
    //   selection: TextSelection.fromPosition(textPosition),
    // );

    /// 执行搜索程序
    inputFocusNode.unfocus();
    inputController.text = state.history[index];
    search(state.history[index]);
  }

  void clearHistory() {
    state.history.clear();
    MyStorageService.to.remove(storageSearchHistoryKey);
    Get.back();
  }

  void showClear() {
    Get.dialog(
      AlertCenter(
        child: AlertCenter.alert(
          title: '清除记录',
          content: '是否确认继续操作',
          onTap: clearHistory,
        ),
      ),
      useSafeArea: false,
    );
  }

  void search(String text) async {
    String _text = text;

    if (_text.isEmpty) {
      _text = ResourceController.to.searchWord;
      inputController.text = _text;
    }

    state.isShowLoading = true;

    // 添加记录
    state.history.add(_text);

    // 去重
    state.history = state.history.toSet().toList();

    // 保存
    MyStorageService.to.setList(storageSearchHistoryKey, state.history);

    var getSearchList = await ResourceApi.getResourceList(
      type: 0,
      pageNo: 1,
      pageSize: 20,
      keyword: _text,
    );

    var searchList = ResourceDataList.fromJson(getSearchList.data);

    if (getSearchList.code == 200) {
      state.resault.update((val) {
        val!.list = searchList.list;
        val.size = searchList.size;
      });

      state.isShowLoading = false;
    }
  }

  @override
  void onReady() async {
    super.onReady();
    await MyTimer.futureMill(300);
    inputFocusNode.requestFocus();

    inputController.addListener(() {
      if (inputController.text.isEmpty) {
        state.resault.update((val) => val!.list.clear());
      }
    });

    scrollController.addListener(() {
      if (state.offsetRx.value != 1.0) state.offsetRx.value = 1.0;
    });

    debounce(state.offsetRx, (double value) {
      if (value == 1.0) inputFocusNode.unfocus();
    }, time: const Duration(milliseconds: 100));

    inputFocusNode.addListener(() {
      if (inputFocusNode.hasFocus) state.offsetRx.value = 0.0;
    });

    if (ResourceController.to.hot.value.list.isEmpty) {
      var getHotList = await ResourceApi.getResourceList(
        pageNo: 1,
        type: 0,
        pageSize: 20,
        sort: 4,
      );

      var hotList = ResourceDataList.fromJson(getHotList.data);

      if (getHotList.code == 200) {
        ResourceController.to.hot.update((val) {
          val!.list = hotList.list;
          val.size = hotList.size;
        });
      }
    }
  }
}
