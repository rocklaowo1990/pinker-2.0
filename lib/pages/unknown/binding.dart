import 'package:get/get.dart';
import 'package:pinker_project/pages/unknown/library.dart';

class UnknownBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnknownController>(() => UnknownController());
  }
}
