import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pinker/common/utils/library.dart';
import 'package:pinker/pages/edit_password/library.dart';

class EditPasswordController extends GetxController {
  final state = EditPasswordState();

  final oldController = TextEditingController();
  final oldFocusNode = FocusNode();
  final newController = TextEditingController();
  final newFocusNode = FocusNode();
  final newReController = TextEditingController();
  final newReFocusNode = FocusNode();

  /// 监听器：舰艇文本输入框
  void listener() {
    if (oldController.text.isEmpty ||
        newController.text.isEmpty ||
        newReController.text.isEmpty) {
      state.isEnable = true;
    } else {
      state.isEnable = false;
    }
  }

  void changePassword() {}

  @override
  void onReady() async {
    super.onReady();

    oldController.addListener(listener);
    newController.addListener(listener);
    newReController.addListener(listener);

    await MyTimer.futureMill(300);
    oldFocusNode.requestFocus();
  }
}
