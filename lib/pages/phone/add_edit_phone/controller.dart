import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/routes/library.dart';
import 'package:pinker/common/utils/library.dart';
import 'package:pinker/pages/phone/add_edit_phone/library.dart';

class AddOrEditPhoneController extends GetxController {
  final state = AddOrEditPhoneState();

  final inputController = TextEditingController();
  final inputFocusNode = FocusNode();

  void linstener() {
    state.isEnable = inputController.text.isEmpty ? true : false;
  }

  void countryCode() {
    Get.toNamed(MyRoutes.areaCode);
  }

  @override
  void onReady() async {
    super.onReady();

    if (ConfigController.to.areaCode.value.isEmpty) {
      ConfigController.to.areaCode.value = '86';
    }

    if (ConfigController.to.areaName.value.isEmpty) {
      ConfigController.to.areaName.value = '中国';
    }
    inputController.addListener(linstener);

    await MyTimer.futureMill(300);
    inputFocusNode.requestFocus();
  }

  @override
  void dispose() {
    inputController.removeListener(linstener);
    super.dispose();
  }
}
