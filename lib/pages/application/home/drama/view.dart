import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pinker/common/theme/library.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/application/home/drama/library.dart';

class DramaView extends GetView<DramaController> {
  const DramaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lottie = LottieBuilder.asset(
      'assets/lottie/home.zip',
      fit: BoxFit.fitWidth,
    );

    var loading = SingleChildScrollView(
      child: lottie,
      controller: controller.homeController.scrollController,
    );

    /// 背景部分
    /// 背景是该页面的下层，也就是主要的内容展示区
    /// 因此背景的排版就是页面的排版
    /// 下方是背景部分的banner顶层的播放按钮和文字
    var playIcon = MyIcons.play();
    var bannerText = MyText.obxOpcity('最新高分电影《二郎神》抢先观看');
    const space = SizedBox(height: 10);
    var column = Column(
      children: [playIcon, space, bannerText],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
    var bannerContent = Padding(
      padding: const EdgeInsets.all(20),
      child: column,
    );

    /// 下方是背景部分的背景图层
    var assetImage = Image.asset(
      'assets/images/home_banner.jpg',
      fit: BoxFit.fitWidth,
    );

    var bannerBacground = Container(
      decoration: MyTheme.decoration,
      clipBehavior: Clip.hardEdge,
      child: assetImage,
    );

    /// 下方是背景部分：banner的组合
    var bannerBox = Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [bannerBacground, bannerContent],
    );

    var body = Column(
      children: [
        bannerBox,
        Container(
          width: double.infinity,
          height: 5000,
          color: Colors.black,
        ),
      ],
    );

    var scaffold = SingleChildScrollView(
      child: body,
      controller: controller.homeController.scrollController,
    );

    return Obx(() => controller.state.isLoading ? loading : scaffold);
  }
}
