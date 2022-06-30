import 'package:get/get.dart';
import 'package:pinker/common/constant/storage.dart';
import 'package:pinker/common/data/resource_data.dart';
import 'package:pinker/common/services/storage.dart';

class SearchState {
  final resault = ResourceDataList.fromJson(ResourceDataList.child).obs;

  final _history = MyStorageService.to.getList(storageSearchHistoryKey).obs;
  set history(List<String> value) => _history.value = value;
  List<String> get history => _history;

  final _isShowLoading = false.obs;
  set isShowLoading(bool value) => _isShowLoading.value = value;
  bool get isShowLoading => _isShowLoading.value;

  final _isShowResault = false.obs;
  set isShowResault(bool value) => _isShowResault.value = value;
  bool get isShowResault => _isShowResault.value;

  final _isRetryHot = false.obs;
  set isRetryHot(bool value) => _isRetryHot.value = value;
  bool get isRetryHot => _isRetryHot.value;

  final _isRetryResault = false.obs;
  set isRetryResault(bool value) => _isRetryResault.value = value;
  bool get isRetryResault => _isRetryResault.value;

  final offsetRx = 0.0.obs;

  /// 热门搜索
  final hot = ResourceDataList.fromJson(ResourceDataList.child).obs;
}
