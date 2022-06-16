import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/utils/library.dart';
import 'package:pinker/pages/add_bank/library.dart';

class AddBankController extends GetxController {
  final state = AddBankState();

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
