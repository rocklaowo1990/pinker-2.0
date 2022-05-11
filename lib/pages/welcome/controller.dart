import 'package:get/get.dart';
import 'package:pinker/common/routes/library.dart';
import 'package:pinker/pages/welcome/library.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();

  void handleHome() {
    /// 进入首页
    Get.offAllNamed(AppRoutes.application);
    // StorageService.to.setBool(storageIsHaveUsed, true);

    /// 改变主题
    // ConfigStore.to.isLightMode = !ConfigStore.to.isLightMode;
    // StorageService.to.setBool(
    //   storageIsLightModeKey,
    //   ConfigStore.to.isLightMode,
    // );
    // ConfigStore.changeSystem();

    /// 更改语言
    // const zhCN = Locale('zh', 'CN');
    // const enUS = Locale('en', 'US');
    // Get.updateLocale(Get.locale == zhCN ? enUS : zhCN);
  }
}
