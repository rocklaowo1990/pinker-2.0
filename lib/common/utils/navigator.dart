import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 嵌套路由封装
GetPageRoute getPageRoute({
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
