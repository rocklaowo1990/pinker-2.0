import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/store/library.dart';
import 'package:pinker/common/theme/colors.dart';
import 'package:pinker/common/theme/library.dart';

import 'package:pinker/common/widgets/library.dart';

import 'package:pinker/pages/set/library.dart';

class SetView extends GetView<SetController> {
  const SetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var setLang = getListRight(
      title: '语言设置',
      icon: 'set_lang',
      onTap: controller.handleSetLang,
    );
    var setTheme = getListSwitch(
      title: '夜间模式',
      icon: 'set_lang',
      onChanged: controller.handleSetTheme,
      isChooise: ConfigStore.to.state.isDarkModeRx,
    );

    var system = Obx(
      () => Container(
        child: Column(
          children: ListTile.divideTiles(
            tiles: [
              setLang,
              setTheme,
            ],
            context: context,
            color: ConfigStore.to.state.isDarkMode
                ? Colors.white12
                : Colors.black12,
          ).toList(),
        ),
        color: ConfigStore.to.state.isDarkMode
            ? DarkColor.primaryBackground
            : LightColor.primaryBackground,
      ),
    );

    var body = ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: getText('系统设置', color: AppColors.primaryColor),
        ),
        system,
      ],
    );

    return Scaffold(
      appBar: getAppBar(title: '设置'),
      body: body,
    );
  }
}
