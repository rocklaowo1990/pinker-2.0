import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/lang/translation_service.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/set/library.dart';

class SetView extends GetView<SetController> {
  const SetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var setLang = getListRight(
    //   title: Lang.setLang.tr,
    //   icon: 'set_lang',
    //   onTap: controller.handleSetLang,
    // );
    // var setTheme = getListSwitch(
    //   title: Lang.setDark.tr,
    //   icon: 'set_dark',
    //   onChanged: controller.handleSetTheme,
    //   isCheck: ConfigStore.to.isLightMode,
    // );

    // var system = Obx(
    //   () => Container(
    //     child: Column(
    //       children: ListTile.divideTiles(
    //         tiles: [
    //           setLang,
    //           setTheme,
    //         ],
    //         context: context,
    //         color: ConfigStore.to.isDarkMode ? Colors.white12 : Colors.black12,
    //       ).toList(),
    //     ),
    //     color: ConfigStore.to.isDarkMode
    //         ? AppColors.primaryBackgroundDark
    //         : AppColors.primaryBackgroundLight,
    //   ),
    // );

    var body = controller.arguments == null
        ? ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: MyText(Lang.setLableSystem.tr),
              ),
              // system,
            ],
          )
        : ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: MyText(Lang.setLableSystem.tr),
              ),
              // system,
              const MyText('text'),
            ],
          );

    return MyScaffold(
      header: const MyAppBar(),
      body: body,
    );
  }
}
