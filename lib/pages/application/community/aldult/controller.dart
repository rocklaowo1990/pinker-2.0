import 'package:get/get.dart';
import 'package:pinker/common/utils/library.dart';
import 'package:pinker/pages/application/community/aldult/library.dart';
import 'package:pinker/pages/application/community/library.dart';

class CommunityAldultController extends GetxController {
  final state = CommunityAldultState();

  final CommunityController communityController = Get.find();

  @override
  void onReady() async {
    super.onReady();

    await MyTimer.futureMill(3000);
    state.isLoading = false;
  }
}
