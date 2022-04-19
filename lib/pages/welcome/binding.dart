import 'package:get/get.dart';
import 'package:pinker/pages/welcome/library.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}
