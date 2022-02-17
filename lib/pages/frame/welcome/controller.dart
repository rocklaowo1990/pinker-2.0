import 'package:get/get.dart';
import 'package:pinker/common/routes/library.dart';
import 'package:pinker/pages/frame/library.dart';

import 'package:pinker/pages/frame/welcome/library.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();
  final FrameController frameController = Get.find();

  void handleSignIn() {
    frameController.state.pageIndex++;

    Get.toNamed(AppRoutes.welcome + AppRoutes.signIn, id: 1);
  }

  void handleSignUp() {
    frameController.state.pageIndex++;

    Get.toNamed(AppRoutes.welcome + AppRoutes.signUp, id: 1);
  }
}
