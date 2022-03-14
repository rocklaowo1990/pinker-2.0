import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinker/common/utils/library.dart';
import 'package:pinker/pages/frame/sign_in/library.dart';
import 'package:pinker/pages/frame/sign_up/library.dart';
import 'package:pinker/pages/frame/welcome/library.dart';

class FrameRouter {
  static const welcome = '/welcome';
  static const signUp = '/signUp';
  static const signIn = '/signIn';

  /// 嵌套路由设置
  static Route? onGenerateRoute(RouteSettings settings) {
    Get.routing.args = settings.arguments;
    if (settings.name == welcome) {
      return getPageRoute(
        page: const WelcomeView(),
        settings: settings,
        binding: WelcomeBinding(),
      );
    } else if (settings.name == signIn) {
      return getPageRoute(
        page: const SignInView(),
        settings: settings,
        binding: SignInBinding(),
      );
    } else if (settings.name == signUp) {
      return getPageRoute(
        page: const SignUpView(),
        settings: settings,
        binding: SignUpBinding(),
      );
    }
    return null;
  }
}
