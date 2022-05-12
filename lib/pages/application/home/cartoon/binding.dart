import 'package:get/get.dart';
import 'package:pinker/pages/application/home/cartoon/library.dart';

class CartoomBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartoomController>(() => CartoomController());
  }
}
