import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinker/common/utils/library.dart';
import 'package:pinker/common/widgets/library.dart';

import 'package:pinker/pages/frame/sign_in/library.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var body = Container(
      color: Colors.green,
      child: Center(
        child: getButton(
          child: getText('text'),
          onPressed: () async {
            var i = await HttpServer().get('https://wwww.baidu.com');
          },
        ),
      ),
    );
    return Scaffold(
      body: body,
    );
  }
}
