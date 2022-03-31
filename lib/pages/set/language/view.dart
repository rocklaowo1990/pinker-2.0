import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/lang/translation_service.dart';

import 'package:pinker/common/theme/library.dart';

import 'package:pinker/common/widgets/library.dart';

import 'package:pinker/pages/set/language/library.dart';

class SetLanguageView extends GetView<SetLanguageController> {
  const SetLanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBar = getAppBar(
      title: Lang.setLangTitle.tr,
      actions: [
        Obx(
          () => AnimatedOpacity(
            opacity: controller.state.local != Get.locale ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: getBarButton(
              Lang.sure.tr,
              onPressed: controller.state.local != Get.locale
                  ? controller.handleSetLanguage
                  : null,
            ),
          ),
        ),
      ],
    );

    var zhCN = Obx(
      () => getListCheck(
        onTap: controller.handleCheckCN,
        isCheck:
            controller.state.local == const Locale('zh', 'CN') ? true : false,
        title: '简体中文',
      ),
    );

    var enUS = Obx(
      () => getListCheck(
        onTap: controller.handleCheckUS,
        isCheck:
            controller.state.local == const Locale('en', 'US') ? true : false,
        title: 'English',
      ),
    );

    var body = ListView(
      children: [
        Obx(
          () => Container(
            child: Column(
              children: ListTile.divideTiles(
                tiles: [
                  zhCN,
                  enUS,
                ],
                context: context,
                color:
                    ConfigStore.to.isDarkMode ? Colors.white12 : Colors.black12,
              ).toList(),
            ),
            color: ConfigStore.to.isDarkMode
                ? DarkColor.primaryBackground
                : LightColor.primaryBackground,
          ),
        )
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
