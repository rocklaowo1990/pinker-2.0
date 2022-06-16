import 'package:get/get.dart';
import 'package:pinker/common/routes/library.dart';
import 'package:pinker/pages/set/library.dart';

class SetController extends GetxController {
  final state = SetState();
  final arguments = Get.arguments;

  static SetController get to => Get.find();

  void handleSetTheme(bool isChooise) {
    /// 改变主题
    // ConfigController.to.isLightMode = !ConfigController.to.isLightMode;
    // StorageService.to.setBool(
    //   storageIsLightModeKey,
    //   ConfigController.to.isLightMode,
    // );
    // ConfigController.changeSystem();
  }

  void handleSetLang() {
    Get.toNamed(MyRoutes.set + MyRoutes.setLanguage);
  }
}
