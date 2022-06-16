import 'package:get/get.dart';
import 'package:pinker/common/constant/library.dart';
import 'package:pinker/common/utils/library.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  //// 令牌 token
  var token = MyStorageService.to.getString(storageUserTokenKey);

  /// 保存 token
  Future<void> setToken(String value) async {
    await MyStorageService.to.setString(storageUserTokenKey, value);
    token = value;
  }
}
