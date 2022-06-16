import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/utils/library.dart';
import 'package:pinker/pages/add_usdt/library.dart';

class AddUsdtController extends GetxController {
  final state = AddUsdtState();

  final inputController = TextEditingController();
  final inputFocusNode = FocusNode();
  @override
  void onReady() async {
    super.onReady();
    await MyTimer.futureMill(300);
    inputFocusNode.requestFocus();
    // nameController.addListener(() {});
  }
}
