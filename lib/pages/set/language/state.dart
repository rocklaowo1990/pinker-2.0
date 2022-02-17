import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetLanguageState {
  final _local = Get.locale.obs;
  set local(Locale? value) => _local.value = value;
  Locale? get local => _local.value;
}
