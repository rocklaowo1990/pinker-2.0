import 'package:get/get.dart';
import 'package:pinker/common/utils/library.dart';

import 'package:pinker/pages/application/home/cartoon/library.dart';
import 'package:pinker/pages/application/home/library.dart';

class CartoomController extends GetxController {
  final state = CartoomState();

  final HomeController homeController = Get.find();

  @override
  void onReady() async {
    super.onReady();

    await MyTimer.futureMill(3000);
    state.isLoading = false;
  }
}
