import 'package:get/get.dart';

import 'package:pinker/pages/initial/library.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialController>(() => InitialController());
  }
}
