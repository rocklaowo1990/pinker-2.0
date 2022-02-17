import 'package:get/get.dart';

import 'package:pinker/pages/set/language/library.dart';

class SetLanguageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetLanguageController>(() => SetLanguageController());
  }
}
