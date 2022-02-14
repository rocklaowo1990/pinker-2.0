import 'package:get/get.dart';
import 'package:pinker_project/common/utils/library.dart';
import 'package:pinker_project/common/values/library.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  // 令牌 token
  String token = '';
  bool isLogin = false;

  @override
  void onInit() {
    super.onInit();
    token = StorageService.to.getString(storageUserTokenKey);
    if (token.isNotEmpty) isLogin = true;
  }

  // 保存 token
  Future<void> setToken(String value) async {
    await StorageService.to.setString(storageUserTokenKey, value);
    token = value;
  }
}
