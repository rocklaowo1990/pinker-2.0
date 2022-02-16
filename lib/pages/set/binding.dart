import 'package:get/get.dart';

import 'package:pinker/pages/set/library.dart';

class SetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetController>(() => SetController());
  }
}
