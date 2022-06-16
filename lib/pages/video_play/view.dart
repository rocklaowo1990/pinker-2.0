import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/style/colors.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/video_play/library.dart';

class VideoPlayView extends GetView<VideoPlayController> {
  const VideoPlayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var header = MyAppBar(
      isShowLine: true,
      center: MyText.text18(controller.arguments.name),
      left: MyButton.back(),
    );

    var loadingBox = Stack(
      children: [
        Positioned(
          child: MyImage(
            imageUrl: controller.arguments.image,
            borderRadius: BorderRadius.zero,
          ),
          top: 0,
          left: 0,
          bottom: 0,
          right: 0,
        ),
        Positioned(
          child: Container(color: Colors.black54),
          top: 0,
          left: 0,
          bottom: 0,
          right: 0,
        ),
        Positioned(
          child: Opacity(
            opacity: 0.5,
            child: MyIcons.lottie('image_holder'),
          ),
          top: 0,
          left: 0,
          bottom: 0,
          right: 0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyIcons.loading(),
            const SizedBox(height: 20),
            const MyText('精彩即将开始...'),
          ],
        ),
      ],
    );
    var body = Column(
      children: [
        Container(
          width: Get.width,
          height: Get.width * 3 / 4,
          child: Obx(() => controller.state.isShowLoading
              ? loadingBox
              : Chewie(controller: controller.chewieController)),
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: MyColors.input,
          ),
          clipBehavior: Clip.hardEdge,
        ),
      ],
    );
    return MyScaffold(header: header, body: body);
  }
}
