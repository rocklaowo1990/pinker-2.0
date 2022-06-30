import 'package:get/get.dart';
import 'package:pinker/common/data/library.dart';

class CommunityCartoomState {
  final mediaTypeList = MediaTypeList.fromJson(MediaTypeList.child).obs;
  final resourceList = ResourceDataList.fromJson(ResourceDataList.child).obs;
  final data = ResourceResponseData.fromJson(ResourceResponseData.child).obs;

  final _isRetry = false.obs;
  set isRetry(bool value) => _isRetry.value = value;
  bool get isRetry => _isRetry.value;
}
