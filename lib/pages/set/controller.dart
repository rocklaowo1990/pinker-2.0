import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pinker/common/store/library.dart';
import 'package:pinker/common/theme/library.dart';
import 'package:pinker/common/utils/library.dart';
import 'package:pinker/common/values/library.dart';

import 'package:pinker/pages/set/library.dart';

class SetController extends GetxController {
  final state = SetState();

  void handleSetTheme(bool isChooise) {
    Get.changeTheme(
      ConfigStore.to.state.isDarkMode ? AppTheme.light : AppTheme.dark,
    );
    ConfigStore.to.state.isDarkMode = isChooise;
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
