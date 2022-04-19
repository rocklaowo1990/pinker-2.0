import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/routes/library.dart';

/// 第一次欢迎页面
class MiddlewareInitial extends GetMiddleware {
  MiddlewareInitial();

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isHaveUsed) {
      return const RouteSettings(name: AppRoutes.application);
    } else {
      return const RouteSettings(name: AppRoutes.welcome);
    }
  }
}
