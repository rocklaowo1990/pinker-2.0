import 'package:get/get.dart';
import 'package:pinker/common/utils/storage.dart';
import 'package:pinker/common/values/storage.dart';

class StoreState {
  final isDarkModeRx = StorageService.to.getBool(storageIsDarkModeKey).obs;
  set isDarkMode(bool value) => isDarkModeRx.value = value;
  bool get isDarkMode => isDarkModeRx.value;
}
