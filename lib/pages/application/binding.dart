import 'package:get/get.dart';

import 'package:pinker_project/pages/application/library.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
  }
}
