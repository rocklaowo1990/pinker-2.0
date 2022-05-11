import 'package:get/get.dart';
import 'package:pinker/pages/application/act/library.dart';

class ActBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActController>(() => ActController());
  }
}
