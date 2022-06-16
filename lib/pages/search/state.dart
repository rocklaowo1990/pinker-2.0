import 'package:get/get.dart';
import 'package:pinker/common/constant/storage.dart';
import 'package:pinker/common/data/resource_data.dart';
import 'package:pinker/common/utils/storage.dart';

class SearchState {
  final resault = ResourceDataList.fromJson(ResourceDataList.child).obs;

  final _history = MyStorageService.to.getList(storageSearchHistoryKey).obs;
  set history(List<String> value) => _history.value = value;
  List<String> get history => _history;

  final _isShowHot = false.obs;
  set isShowHot(bool value) => _isShowHot.value = value;
  bool get isShowHot => _isShowHot.value;

  final _isShowLoading = false.obs;
  set isShowLoading(bool value) => _isShowLoading.value = value;
  bool get isShowLoading => _isShowLoading.value;

  final offsetRx = 0.0.obs;
}
