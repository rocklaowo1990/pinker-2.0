import 'package:get/get.dart';
import 'package:pinker/common/data/library.dart';

class CommunityMovieState {
  final mediaTypeList = MediaTypeList.fromJson(MediaTypeList.child).obs;
  final resourceList = ResourceDataList.fromJson(ResourceDataList.child).obs;

  final data = ResourceResponseData.fromJson(ResourceResponseData.child).obs;
}
