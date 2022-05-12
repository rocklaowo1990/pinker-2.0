import 'package:get/get.dart';
import 'package:pinker/pages/application/home/aldult/library.dart';

class AldultBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AldultController>(() => AldultController());
  }
}
