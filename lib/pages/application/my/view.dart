import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pinker/common/style/library.dart';
import 'package:pinker/common/utils/library.dart';

import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/application/my/library.dart';

class MyView extends GetView<MyController> {
  const MyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// appBar 的子内容
    var appBarChildren = [
      MyButton.customer(),
      const SizedBox(width: 40),
      MyButton.email(),
      const SizedBox(width: 20),
    ];

    var appBarChild = Row(
      children: appBarChildren,
      mainAxisAlignment: MainAxisAlignment.end,
    );

    /// appBar 的组成
    var appBar = MyAppBar(isTransparent: true, center: appBarChild);

    /// appBar 的动态背景
    Widget obxBuild() {
      var container = Container(color: MyColors.primary);

      var opcatiy = Opacity(opacity: 0.5, child: container);

      var filter = ImageFilter.blur(sigmaX: 16, sigmaY: 16);

      var backdropFilter = BackdropFilter(filter: filter, child: opcatiy);

      var clipRect = ClipRect(child: backdropFilter);

      return Positioned(
        child: Opacity(opacity: controller.state.opacity, child: clipRect),
        left: 0,
        right: 0,
        top: 0,
        bottom: 0,
      );
    }

    /// APPBAR
    var header = Stack(children: [Obx(obxBuild), appBar]);

    /// 下面是底部的内容
    var bannerImage = SvgPicture.asset(
      'assets/svg/my_banner.svg',
      width: Get.width,
    );

    /// 钱包的样式
    const diamondBoxDecoration = BoxDecoration(
      borderRadius: MyStyle.borderRadius,
      color: MyColors.appBar,
    );

    /// 钱包的标题
    const diamonTitle = MyText('钻石账户');

    /// 充值按钮
    const rechargeButton = MyButton(
      child: MyText('充值'),
      width: 80,
      height: 36,
      color: MyColors.primary,
    );

    /// 钱包标题的子内容
    var diamonTitleBoxChildren = [
      MyIcons.diamond(),
      const SizedBox(width: 10),
      diamonTitle,
    ];

    /// 钱包标题
    var diamonTitleBox = Row(children: diamonTitleBoxChildren);

    /// 钱包内容的子内容
    var diamonContentBoxChildren = [
      MyText(MyCharacter.getMoney(1234121.987, fixed: 0), fontSize: 32),
      const Spacer(),
      rechargeButton,
    ];

    /// 钱包的内容
    var diamonContentBox = Row(children: diamonContentBoxChildren);

    /// 钱包的标题和内容的组合数组
    var diamonBoxChildren = [
      diamonTitleBox,
      const SizedBox(height: 16),
      Container(height: 1, width: double.infinity, color: Colors.white10),
      const SizedBox(height: 32),
      diamonContentBox,
      const SizedBox(height: 16),
    ];

    /// 钱包的组合
    var diamonBox = Container(
      width: Get.width - 32,
      decoration: diamondBoxDecoration,
      child: Column(children: diamonBoxChildren),
      padding: const EdgeInsets.all(16),
    );

    /// 钱包的安全位置
    var diamondBoxSafe = SafeArea(bottom: false, child: diamonBox);

    /// 钱包和顶部的距离
    var diamondBoxPadding = Padding(
      child: diamondBoxSafe,
      padding: const EdgeInsets.only(top: 90),
    );

    /// 钱包和banner的结合
    var bannerChildren = [
      bannerImage,
      diamondBoxPadding,
    ];

    /// 钱包和banner的组合
    var banner = Stack(
      alignment: AlignmentDirectional.topCenter,
      children: bannerChildren,
    );

    /// 第一排按钮的内容
    var commonChildren = [
      MyButton.my(
        icon: MyIcons.history(),
        text: '观看记录',
        onTap: controller.history,
      ),
      MyButton.my(
        icon: MyIcons.bank(),
        text: '银行卡',
        onTap: controller.bank,
      ),
      MyButton.my(
        icon: MyIcons.phone(),
        text: '手机',
        onTap: controller.phone,
      ),
      MyButton.my(icon: MyIcons.password(), text: '密码', onTap: () {}),
      MyButton.my(icon: MyIcons.broken(), text: '注销账户', onTap: () {}),
      MyButton.my(icon: MyIcons.exit(), text: '退出登录', onTap: () {}),
    ];
    var commonBox = Wrap(
      spacing: 10,
      runSpacing: 10,
      children: commonChildren,
    );

    var bodyChildren = [
      banner,
      const SizedBox(height: 10),
      commonBox,
      const SizedBox(height: 10),
    ];

    var background = Stack(children: [
      Obx(
        () => Container(
          color: controller.state.scrollOffset >= 0
              ? MyColors.background
              : MyColors.primary,
        ),
      ),
      SingleChildScrollView(
        child: Container(
          child: Column(children: bodyChildren),
          color: MyColors.background,
        ),
        controller: controller.scrollController,
      )
    ]);

    return MyScaffold(
      header: header,
      background: background,
    );
  }
}
