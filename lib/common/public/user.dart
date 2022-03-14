import 'package:get/get.dart';
import 'package:pinker/common/constant/library.dart';
import 'package:pinker/common/utils/library.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  // 令牌 token
  String token = '';
  bool isLogin = false;

  @override
  void onReady() {
    super.onReady();
    token = StorageService.to.getString(storageUserTokenKey);
    if (token.isNotEmpty) isLogin = true;
  }

  // 保存 token
  Future<void> setToken(String value) async {
    await StorageService.to.setString(storageUserTokenKey, value);
    token = value;
  }
}
