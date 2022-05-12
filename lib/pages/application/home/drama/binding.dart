import 'package:get/get.dart';
import 'package:pinker/pages/application/home/drama/library.dart';

class DramaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DramaController>(() => DramaController());
  }
}
