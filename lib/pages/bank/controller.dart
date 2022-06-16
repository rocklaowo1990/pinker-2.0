import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/routes/library.dart';
import 'package:pinker/pages/bank/library.dart';

class BankController extends GetxController {
  final state = BankState();

  final inputController = TextEditingController();
  final inputFocusNode = FocusNode();

  void addBank() {
    Get.toNamed(MyRoutes.addBank);
  }

  void addUsdt() {
    Get.toNamed(MyRoutes.addUsdt);
  }
}
