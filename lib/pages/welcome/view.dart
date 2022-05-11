import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/lang/translation_service.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/welcome/library.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 顶部文字标题
    var title = MyText.obxWelcom(Lang.welcomeTitle.tr);

    /// 顶部文字副标题
    var secondTitle = MyText.obxOpcity(Lang.welcomeSecondTitle.tr);

    /// 标题和副标题的间距
    const space = SizedBox(height: 10);

    /// 标题和副标题的组合
    var top = Column(children: [
      title,
      space,
      secondTitle,
    ]);

    /// 中间图片部分
    var image = Image.asset('assets/images/tp2.png');

    /// 按钮的构成
    var button = MyButton.infinity(
      Lang.welcomeButton.tr,
      onTap: controller.handleHome,
    );

    /// 页面的成员数组
    var children = [top, image, button];

    /// 页面的排列方式
    var column = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );

    /// 页面的左右上下边距
    var padding = Padding(
      padding: const EdgeInsets.fromLTRB(60, 80, 60, 30),
      child: column,
    );

    /// 页面的安全区域
    var body = SafeArea(child: padding);

    /// 背景图片
    var backgroundImage = Image.asset(
      'assets/images/bg.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );

    var color = Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
    );

    Widget background() {
      return ConfigStore.to.isLightMode ? color : backgroundImage;
    }

    var backgrond = Obx(background);

    /// 页面构造
    return MyScaffold(
      body: body,
      background: backgrond,
    );
  }
}
