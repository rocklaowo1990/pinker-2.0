import 'package:get/get.dart';

import 'package:pinker/common/constant/library.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/routes/library.dart';

import 'package:pinker/common/theme/library.dart';
import 'package:pinker/common/utils/library.dart';

import 'package:pinker/pages/set/library.dart';

class SetController extends GetxController {
  final state = SetState();
  final arguments = Get.arguments;

  static SetController get to => Get.find();

  void handleSetTheme(bool isChooise) {
    Get.changeTheme(
      ConfigStore.to.isLightMode ? MyTheme.light : MyTheme.dark,
    );
    ConfigStore.to.isLightMode = isChooise;
    StorageService.to.setBool(
      storageIsLightModeKey,
      ConfigStore.to.isLightMode,
    );
  }

  void handleSetLang() {
    Get.toNamed(AppRoutes.set + AppRoutes.setLanguage);
  }
}
