import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:pinker/pages/set/language/library.dart';

class SetLanguageController extends GetxController {
  final state = SetLanguageState();

  void handleSetLanguage() async {
    Get.back();
  }

  void handleCheckCN() {
    state.local = const Locale('zh', 'CN');
  }

  void handleCheckUS() {
    state.local = const Locale('en', 'US');
  }

  @override
  void onClose() async {
    await Get.updateLocale(
      state.local ?? const Locale('zh', 'CN'),
    );
    super.onClose();
  }
}
