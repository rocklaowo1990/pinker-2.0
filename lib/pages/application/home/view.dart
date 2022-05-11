import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/application/home/library.dart';
import 'package:pinker/pages/application/home/movie/view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 顶层部分
    /// 包含 AppBar 和 TabBar
    /// 下方是 Appbar
    var logo = MyIcons.logo();
    const input = MyInput();

    var appBar = MyAppBar(
      isTransparent: true,
      center: Row(
        children: [
          logo,
          const SizedBox(width: 10),
          const Expanded(child: input)
        ],
      ),
    );

    const tabs = ['电影', '电视剧', '综艺', '动漫', '午夜剧场', '其他的'];

    Widget itemBuilder(BuildContext buildContext, int index) {
      const space = SizedBox(width: 16);

      Widget obxBuild() {
        const borderSide = BorderSide(color: Colors.green, width: 2);
        const border = Border(bottom: borderSide);
        var boxBorder = controller.state.pageIndex == index ? border : null;
        var green = Colors.green;
        var white = Colors.white;
        var textColor = controller.state.pageIndex == index ? [green] : [white];
        var myText = MyText(
          tabs[index],
          fontSize: 16,
          colors: textColor,
        );
        var decoration = BoxDecoration(border: boxBorder);
        return Container(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          decoration: decoration,
          child: myText,
        );
      }

      void onTap() {
        controller.state.pageIndex = index;
      }

      var button = MyButton(
        child: Obx(obxBuild),
        onTap: onTap,
      );

      var haveSpace = Row(children: [button, space]);

      return index == tabs.length ? button : haveSpace;
    }

    var listView = ListView.builder(
      itemBuilder: itemBuilder,
      itemCount: tabs.length,
      scrollDirection: Axis.horizontal,
    );

    var tabBar = SizedBox(
      width: Get.width,
      height: 55,
      child: listView,
    );

    var headerColumn = Column(children: [appBar, tabBar]);

    Widget obxBuild() {
      var color = Color.fromARGB(controller.state.opacity, 14, 14, 17);

      return Container(
        child: headerColumn,
        color: color,
      );
    }

    var header = Obx(obxBuild);

    /// 这里开始是整个页面的组合部分
    var background = PageView(
      controller: controller.pageController,
      children: const [
        MovieView(),
      ],
    );

    var scaffold = MyScaffold(
      background: background,
      header: header,
    );

    return scaffold;
  }
}
