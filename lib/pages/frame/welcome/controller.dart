import 'package:get/get.dart';
import 'package:pinker/common/class/library.dart';

import 'package:pinker/pages/frame/library.dart';

import 'package:pinker/pages/frame/welcome/library.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();
  final FrameController frameController = Get.find();

  void handleSignIn() {
    frameController.state.pageIndex++;
    Get.toNamed(FrameRouter.signIn, id: 1);
  }

  void handleSignUp() async {
    frameController.state.pageIndex++;

    Get.toNamed(FrameRouter.signUp, id: 1);
  }
}
