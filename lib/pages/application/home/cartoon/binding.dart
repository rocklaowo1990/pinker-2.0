import 'package:get/get.dart';
import 'package:pinker/pages/application/home/cartoon/library.dart';

class CartoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartoomController>(() => CartoomController());
  }
}
