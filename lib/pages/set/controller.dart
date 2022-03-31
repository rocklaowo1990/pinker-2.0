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

  void handleSetTheme(bool isChooise) {
    Get.changeTheme(
      ConfigStore.to.isDarkMode ? AppTheme.light : AppTheme.dark,
    );
    ConfigStore.to.isDarkMode = isChooise;
    StorageService.to.setBool(
      storageIsDarkModeKey,
      ConfigStore.to.isDarkMode,
    );
  }

  void handleSetLang() {
    Get.toNamed(AppRoutes.set + AppRoutes.setLanguage);
  }
}
