import 'package:get/get.dart';

import 'package:pinker_project/pages/initial/library.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialController>(() => InitialController());
  }
}
