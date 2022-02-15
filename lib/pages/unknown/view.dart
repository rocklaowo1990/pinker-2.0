import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker_project/common/widgets/text.dart';
import 'package:pinker_project/pages/unknown/library.dart';

class UnknownView extends GetView<UnknownController> {
  const UnknownView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getText('UnknowView'),
      ),
    );
  }
}
