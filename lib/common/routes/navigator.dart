import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      return _getPageRoute(
        page: const WelcomeView(),
        settings: settings,
        binding: WelcomeBinding(),
      );
    } else if (settings.name == signIn) {
      return _getPageRoute(
        page: const SignInView(),
        settings: settings,
        binding: SignInBinding(),
      );
    } else if (settings.name == signUp) {
      return _getPageRoute(
        page: const SignUpView(),
        settings: settings,
        binding: SignUpBinding(),
      );
    }
    return null;
  }

  /// 嵌套路由封装
  static GetPageRoute _getPageRoute({
    required RouteSettings settings,
    required Widget page,
    Bindings? binding,
  }) {
    return GetPageRoute(
      settings: settings,
      page: () => page,
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      binding: binding,
      popGesture: false,
    );
  }
}
