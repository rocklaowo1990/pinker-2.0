import 'package:get/get.dart';
import 'package:pinker/common/constant/library.dart';
import 'package:pinker/common/data/library.dart';
import 'package:pinker/common/services/librart.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  //// 令牌 token
  var token = MyStorageService.to.getString(storageUserTokenKey);

  /// 保存 token
  void setToken(String value) {
    token = value;
    MyStorageService.to.setString(storageUserTokenKey, value);
  }

  /// 用户信息
  var userInfo = UserInfo.fromJson(UserInfo.child).obs;

  /// 区号列表数据
  /// areaCodeList: 区号列表数据
  /// areaCode：区号的状态，改变时会对应的改变页面的文字
  /// areaShortName：区号的短名称
  final areaCodeList = AreaCodeListData.fromJson(AreaCodeListData.child);
  final areaCode = MyStorageService.to.getString(storageAreaCodeKey).obs;
  String areaShortName = 'CN';
}
