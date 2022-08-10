import 'package:get/get.dart';

class AddOrEditPhoneState {
  /// 是否禁用按钮
  final _isEnable = true.obs;
  set isEnable(bool value) => _isEnable.value = value;
  bool get isEnable => _isEnable.value;

  /// 区号
  final _code = '+86'.obs;
  set code(String value) => _code.value = value;
  String get code => _code.value;

  /// 国家
  final _country = '中国'.obs;
  set country(String value) => _country.value = value;
  String get country => _country.value;
}
