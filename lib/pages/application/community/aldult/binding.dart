import 'package:get/get.dart';
import 'package:pinker/pages/application/community/aldult/library.dart';

class CommunityAldultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunityAldultController>(() => CommunityAldultController());
  }
}
