import 'package:get/get.dart';
import 'package:pinker/common/utils/library.dart';
import 'package:pinker/pages/application/community/drama/library.dart';
import 'package:pinker/pages/application/community/library.dart';

class CommunityDramaController extends GetxController {
  final state = CommunityDramaState();
  final CommunityController communityController = Get.find();

  @override
  void onReady() async {
    super.onReady();

    await MyTimer.futureMill(3000);
    state.isLoading = false;
  }
}
