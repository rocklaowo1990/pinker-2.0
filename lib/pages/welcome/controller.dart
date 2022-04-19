import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinker/common/constant/storage.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/routes/library.dart';
import 'package:pinker/common/utils/storage.dart';

import 'package:pinker/pages/welcome/library.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();

  void handleSignIn() {
    Get.toNamed(AppRoutes.application);
  }

  void handleSignUp() {
    ConfigStore.to.isDarkMode = !ConfigStore.to.isDarkMode;
    StorageService.to.setBool(storageIsDarkModeKey, ConfigStore.to.isDarkMode);
    if (ConfigStore.to.isDarkMode) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
  }
}
