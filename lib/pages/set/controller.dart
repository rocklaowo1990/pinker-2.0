import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pinker_project/common/store/library.dart';
import 'package:pinker_project/common/theme/library.dart';
import 'package:pinker_project/common/utils/library.dart';
import 'package:pinker_project/common/values/library.dart';

import 'package:pinker_project/pages/set/library.dart';

class SetController extends GetxController {
  final state = SetState();

  void handleSetTheme() {
    Get.changeTheme(
      ConfigStore.to.state.isDarkMode ? AppTheme.light : AppTheme.dark,
    );
    ConfigStore.to.state.isDarkMode = !ConfigStore.to.state.isDarkMode;
    StorageService.to.setBool(
      storageIsDarkModeKey,
      ConfigStore.to.state.isDarkMode,
    );
  }

  void handleSetLang() {
    Get.updateLocale(
      Get.locale == const Locale('zh', 'CN')
          ? const Locale('en', 'US')
          : const Locale('zh', 'CN'),
    );
  }
}
