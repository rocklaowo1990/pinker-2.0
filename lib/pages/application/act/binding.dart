import 'package:get/get.dart';
import 'package:pinker/pages/application/act/library.dart';

class ActBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActController>(() => ActController());
  }
}
