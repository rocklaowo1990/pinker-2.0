import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/country_code/library.dart';

class CountryCodeView extends GetView<CountryCodeController> {
  const CountryCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var header = MyAppBar(
      isShowLine: true,
      left: MyButton.back(),
      center: const MyText('选择区号'),
    );

    var body = Container();

    return MyScaffold(header: header, body: body);
  }
}
