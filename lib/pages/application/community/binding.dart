import 'package:get/get.dart';
import 'package:pinker/pages/application/community/library.dart';

class CommunityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunityController>(() => CommunityController());
  }
}
