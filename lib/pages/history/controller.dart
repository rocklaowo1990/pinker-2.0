import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinker/pages/history/library.dart';

class HistoryController extends GetxController {
  final state = HistoryState();

  final inputController = TextEditingController();
  final inputFocusNode = FocusNode();
}
