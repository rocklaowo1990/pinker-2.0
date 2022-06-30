import 'package:get/get.dart';
import 'package:pinker/common/data/library.dart';

class VideoPlayState {
  final _isShowLoading = true.obs;
  set isShowLoading(bool value) => _isShowLoading.value = value;
  bool get isShowLoading => _isShowLoading.value;

  final _isRetry = false.obs;
  set isRetry(bool value) => _isRetry.value = value;
  bool get isRetry => _isRetry.value;

  final pageIndex = 0.obs;

  // final _buttonIndex = 0.obs;
  // set buttonIndex(int value) => _buttonIndex.value = value;
  // int get buttonIndex => _buttonIndex.value;

  final _chooise = [0, 0].obs;
  set chooise(List<int> value) => _chooise.value = value;
  List<int> get chooise => _chooise;

  final resourceList = ResourceDataList.fromJson(ResourceDataList.child).obs;
  final resourceData = ResourceData.fromJson(ResourceData.child).obs;
}
