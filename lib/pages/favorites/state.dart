import 'package:get/get.dart';
import 'package:pinker/common/data/library.dart';

class FavoritesState {
  final history = ResourceDataList.fromJson(ResourceDataList.child).obs;

  final _isLoading = true.obs;
  set isLoading(bool value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  final _isRetry = false.obs;
  set isRetry(bool value) => _isRetry.value = value;
  bool get isRetry => _isRetry.value;
}
