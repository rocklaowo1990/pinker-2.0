import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinker/common/middlewares/library.dart';
import 'package:pinker/common/routes/observers.dart';
import 'package:pinker/pages/application/library.dart';
import 'package:pinker/pages/frame/library.dart';

import 'package:pinker/pages/initial/library.dart';
import 'package:pinker/pages/initial/view.dart';
import 'package:pinker/pages/set/binding.dart';
import 'package:pinker/pages/set/view.dart';
import 'package:pinker/pages/unknown/library.dart';

import 'library.dart';

class AppPages {
  static const initial = AppRoutes.initial;
  static List<String> history = [];
  static final RouteObserver<Route> observer = RouteObservers();

  static final unknownRoute = GetPage(
    name: AppRoutes.unknownRoute,
    page: () => const UnknownView(),
    binding: UnknownBinding(),
  );

  static final List<GetPage> getPages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const InitialView(),
      middlewares: [
        MiddlewareInitial(),
      ],
    ),
    GetPage(
      name: AppRoutes.frame,
      page: () => const FrameView(),
      binding: FrameBinding(),
    ),
    GetPage(
      name: AppRoutes.application,
      page: () => const ApplicationView(),
      binding: ApplicationBinding(),
    ),
    GetPage(
      name: AppRoutes.set,
      page: () => const SetView(),
      binding: SetBinding(),
    ),
  ];
}
