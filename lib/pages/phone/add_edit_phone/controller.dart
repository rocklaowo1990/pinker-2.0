import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    Get.toNamed(MyRoutes.countryCode);
  }

  @override
  void onReady() async {
    super.onReady();
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
