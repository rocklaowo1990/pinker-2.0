import 'package:get/get.dart';
import 'package:pinker/pages/frame/library.dart';

class FrameBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FrameController>(() => FrameController());
  }
}
