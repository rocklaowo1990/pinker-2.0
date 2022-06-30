import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinker/common/style/library.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/application/community/show/library.dart';
import 'package:pinker/pages/application/community/widgets/library.dart';

class CommunityShowView extends GetView<CommunityShowController> {
  const CommunityShowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 骨架动画
    // var lottie = SingleChildScrollView(
    //   child: MyIcons.lottie('home'),
    //   controller: controller.communityController.scrollController,
    // );

    var _medias = controller.state.resourceList;
    var _types = controller.state.mediaTypeList;

    void getData() async {
      controller.state.isRetry = false;
      if (controller.state.mediaTypeList.value.list.isEmpty) {
        await controller.getTypes();
      }
      await controller.getMedias(type: controller.type);
    }

    Widget obxBuild() {
      var loading = Padding(
        padding: const EdgeInsets.only(top: 20),
        child: MyIcons.loading(),
      );
      var children = [
        const SizedBox(height: 20),
        for (int i = 0; i < _types.value.list.length; i++)
          CommunityButtonTabBar(
            typeName: _types.value.list[i].mediaTypeName,
            list: _types.value.list[i].typelist,
            onTap: controller.typesClick,
            chooseIndex: controller.chooseIndex[i],
            typeIndex: i,
          ),
        MediaBox(mediaDataList: _medias.value.list),
        if (!controller.state.isRetry &&
            (_types.value.list.isEmpty || _medias.value.list.isEmpty))
          loading,
        if (controller.state.isRetry &&
            (_types.value.list.isEmpty || _medias.value.list.isEmpty))
          MyButton.retry(onTap: getData),
      ];

      return MyListView(children: children);
    }

    return Container(
      child: Obx(obxBuild),
      color: MyColors.background,
    );
  }
}
