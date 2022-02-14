import 'package:get/get.dart';
import 'package:pinker_project/common/utils/storage.dart';
import 'package:pinker_project/common/values/storage.dart';

class StoreState {
  final _isDarkMode = StorageService.to.getBool(storageIsDarkModeKey).obs;
  set isDarkMode(bool value) => _isDarkMode.value = value;
  bool get isDarkMode => _isDarkMode.value;
}
