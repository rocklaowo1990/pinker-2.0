import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/style/library.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/application/short/library.dart';

class ShortView extends GetView<ShortController> {
  const ShortView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = controller.state;
    final shortList = ResourceController.to.shortList;

    Widget itemBuilder(BuildContext context, int index) {
      /// 加载动画
      var lottie = MyIcons.lottie('image_holder', fit: BoxFit.fill);

      /// 视频的封面图
      var videoImage = Obx(() {
        var imageBox = MyImage(
          imageUrl: shortList.value.list[index].image,
          borderRadius: BorderRadius.zero,
        );
        return shortList.value.list[index].image.isEmpty ? lottie : imageBox;
      });

      /// 视频区的遮罩，主要是遮住封面图
      var mark = Container(color: Colors.black54);

      /// 视频加载动画只需要 0.5 的透明度，这里是处理透明度的
      var lottieOpcaty = Opacity(opacity: 0.5, child: lottie);

      /// 加载中的组成部分
      var loadingContentChildren = <Widget>[
        MyIcons.loading(),
        const SizedBox(height: 20),
        const MyText('精彩即将开始...'),
        const SizedBox(height: 8),
        MyText.gray16('(影片加载中无法切换视频)'),
      ];

      /// 加载中：精彩即将开始。。。
      var loadingContent = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: loadingContentChildren,
      );

      /// 加载中的组成方式：
      /// 封面图放最底下
      /// 遮罩罩住封面图
      /// 加载动画
      /// 最后把加载中放到顶层
      var loadingBox = Stack(children: [
        Positioned(child: videoImage, top: 0, left: 0, bottom: 0, right: 0),
        Positioned(child: mark, top: 0, left: 0, bottom: 0, right: 0),
        Positioned(child: lottieOpcaty, top: 0, left: 0, bottom: 0, right: 0),
        loadingContent,
      ]);

      /// 如果在加载中，那就是展示加载的样式
      /// 如果是在播放，那就展示播放的内容
      var videoBoxChild = Obx(() => state.isShowLoading
          ? loadingBox
          : Chewie(controller: controller.chewieController));

      /// 播放区的样式
      const videoBoxChildDecortion = BoxDecoration(
        shape: BoxShape.rectangle,
        color: MyColors.black,
      );

      /// 播放器的容器
      return Container(
        width: Get.width,
        height: Get.height,
        child: videoBoxChild,
        decoration: videoBoxChildDecortion,
        clipBehavior: Clip.hardEdge,
      );
    }

    var body = Obx(() {
      const neverScroll = NeverScrollableScrollPhysics();
      var physics = state.isShowLoading ? neverScroll : null;
      return PageView.builder(
        itemBuilder: itemBuilder,
        itemCount: shortList.value.list.length,
        scrollDirection: Axis.vertical,
        onPageChanged: controller.onPageChanged,
        physics: physics,
      );
    });

    return MyScaffold(body: body);
  }
}
