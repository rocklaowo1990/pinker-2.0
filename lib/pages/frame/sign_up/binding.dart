import 'package:get/get.dart';

import 'package:pinker/pages/frame/sign_up/library.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
