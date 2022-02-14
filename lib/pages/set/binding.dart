import 'package:get/get.dart';

import 'package:pinker_project/pages/set/library.dart';

class SetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetController>(() => SetController());
  }
}
