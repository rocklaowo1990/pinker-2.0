import 'package:get/get.dart';

import 'package:pinker/pages/frame/sign_in/library.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
