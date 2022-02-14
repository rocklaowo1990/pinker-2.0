import 'package:get/get.dart';
import 'package:pinker_project/pages/frame/welcome/library.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}
