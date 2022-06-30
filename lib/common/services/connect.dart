import 'package:get/get.dart';

class MyConnect extends GetConnect {
  static MyConnect get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = baseUrl;
  }
}
