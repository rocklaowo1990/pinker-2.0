import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:pinker/common/style/library.dart';
import 'package:pinker/common/utils/library.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/video_play/library.dart';

class VideoPlayView extends GetView<VideoPlayController> {
  const VideoPlayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var resourceData = controller.state.resourceData;
    var resourceList = controller.state.resourceList;

    var header = MyAppBar(
      isShowLine: true,
      center: Obx(() => MyText.text18('正在播放: ${resourceData.value.name}')),
      left: MyButton.back(),
    );

    var lottie = MyIcons.lottie('image_holder');

    var videoImage = Obx(() {
      var imageBox = MyImage(
        imageUrl: resourceData.value.image,
        borderRadius: BorderRadius.zero,
      );
      return resourceData.value.image.isEmpty ? lottie : imageBox;
    });

    var mark = Container(color: Colors.black54);

    var lottieOpcaty = Opacity(opacity: 0.5, child: lottie);

    var loadingContentChildren = [
      MyIcons.loading(),
      const SizedBox(height: 20),
      const MyText('精彩即将开始...'),
    ];

    var loadingContent = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: loadingContentChildren,
    );

    var loadingBoxChildren = [
      Positioned(child: videoImage, top: 0, left: 0, bottom: 0, right: 0),
      Positioned(child: mark, top: 0, left: 0, bottom: 0, right: 0),
      Positioned(child: lottieOpcaty, top: 0, left: 0, bottom: 0, right: 0),
      loadingContent,
    ];

    var loadingBox = Stack(children: loadingBoxChildren);

    const videoBoxChildDecortion = BoxDecoration(
      shape: BoxShape.rectangle,
      color: MyColors.black,
    );

    var videoBoxChild = Obx(() => controller.state.isShowLoading
        ? loadingBox
        : Chewie(controller: controller.chewieController));

    var videBox = Container(
      width: Get.width,
      height: Get.width * 720 / 1280,
      child: videoBoxChild,
      decoration: videoBoxChildDecortion,
      clipBehavior: Clip.hardEdge,
    );

    var title = Obx(() => MyText.text24(resourceData.value.name));

    var playUrlsTitle = Obx(() {
      return MyTabBar(
        pageController: controller.pageController,
        pageIndex: controller.state.pageIndex,
        tabs: resourceData.value.playUrls.map((e) => e.title).toList(),
      );
    });

    var partsBox = Obx(() {
      var playUrls = resourceData.value.playUrls;

      Widget itemBuilder(BuildContext context, int pageIndex) {
        Widget getButton(int buttonIndex) {
          return Obx(() {
            // print(buttonIndex);
            // print(controller.state.pageIndex.value);
            // print(controller.state.buttonIndex);
            // var textColor = controller.state.index == index
            //     ? MyColors.text
            //     : MyColors.secondText;

            var primaryColor = MyColors.primary;

            var inputColor = MyColors.input;

            void _onTap() async {
              if (controller.videoPlayerController.value.isInitialized) {
                controller.videoPlayerController.dispose();
                controller.chewieController.dispose();

                controller.state.chooise = [
                  controller.state.pageIndex.value,
                  buttonIndex,
                ];
                await controller.videoPlay(
                  resourceData.value.playUrls[controller.state.pageIndex.value]
                      .urls[buttonIndex],
                );
              }
            }

            var isChooise = controller.state.pageIndex.value ==
                    controller.state.chooise[0] &&
                buttonIndex == controller.state.chooise[1];
            var isShowLoading = controller.state.isShowLoading;
            var isLoading = isChooise || isShowLoading;

            return MyButton(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: MyText('第 ${buttonIndex + 1} 集', color: MyColors.text),
              ),
              color: isChooise ? primaryColor : inputColor,
              onTap: isLoading || isChooise ? null : _onTap,
            );
          });
        }

        return ListView.separated(
          itemBuilder: (context, index) => getButton(index),
          itemCount: playUrls[pageIndex].urls.length,
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          scrollDirection: Axis.horizontal,
        );
      }

      var pageView = PageView.builder(
        itemBuilder: itemBuilder,
        itemCount: playUrls.length,
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
      );

      // var = children[index].urls.asMap().keys.length

      return SizedBox(height: 40, child: pageView);
    });

    Widget getContentBox() {
      /// 影片的年份 ｜ 地区 ｜ 子类型
      var yearChildren = [
        if (resourceData.value.score != null) '★ ${resourceData.value.score!}',
        if (resourceData.value.score != null) ' | ',
        if (resourceData.value.year != null) resourceData.value.year,
        if (resourceData.value.year != null) ' | ',
        if (resourceData.value.country != null) resourceData.value.country,
        if (resourceData.value.country != null) ' | ',
        if (resourceData.value.mediaType != null) resourceData.value.mediaType,
        if (resourceData.value.mediaType != null) ' | ',
        if (resourceData.value.ranking != null)
          '排名: ${resourceData.value.ranking!}'
      ];

      var yearString = MyCharacter.getListToString(yearChildren);

      var favorites = LikeButton(
        onTap: controller.onFavorites,
        size: 20,
        isLiked: controller.isFavorites,
        likeCountPadding: const EdgeInsets.only(left: 8),
        likeCount: 0,
        likeBuilder: (bool isLiked) {
          return isLiked ? MyIcons.likePress() : MyIcons.like();
        },
        mainAxisAlignment: MainAxisAlignment.start,
        countBuilder: (int? count, bool isLiked, String text) {
          return MyText.gray14(controller.isFavorites ? '已收藏' : '收藏');
        },
        likeCountAnimationType: LikeCountAnimationType.part,
      );

      var contentBoxChildren = [
        Row(children: [title, const Spacer(), favorites]),
        const SizedBox(height: 8),
        if (yearChildren.isNotEmpty) MyText.gray14(yearString, lineHeight: 1.3),
        if (resourceData.value.actors != null)
          MyText.gray14('演员: ${resourceData.value.actors!}', lineHeight: 1.3),
        if (resourceData.value.director != null)
          MyText.gray14('导演: ${resourceData.value.director!}', lineHeight: 1.3),
        if (resourceData.value.introduce != null)
          MyText.gray14(
            '剧情: ${resourceData.value.introduce!}',
            maxLines: 3,
            lineHeight: 1.3,
          ),
        const SizedBox(height: 8),
        playUrlsTitle,
        const SizedBox(height: 16),
        partsBox,
      ];

      return Column(
        children: contentBoxChildren,
        crossAxisAlignment: CrossAxisAlignment.start,
      );
    }

    var contentBox = Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Obx(getContentBox),
    );

    var guessBox = Obx(() {
      var data = MediaBox(
        mediaDataList: resourceList.value.list,
        title: resourceList.value.list.isEmpty ? null : '猜你喜欢',
        onTap: controller.guessPlay,
      );
      var loading = Padding(
        padding: const EdgeInsets.only(top: 32),
        child: MyIcons.loading(),
      );

      return !controller.state.isRetry && resourceList.value.list.isEmpty
          ? loading
          : data;
    });

    var bodyChildren = [contentBox, guessBox];

    var bodyChild = Column(children: bodyChildren);

    var body = SingleChildScrollView(
      child: bodyChild,
      controller: controller.scrollController,
    );

    return MyScaffold(
        header: header,
        body: Column(children: [videBox, Expanded(child: body)]));
  }
}
