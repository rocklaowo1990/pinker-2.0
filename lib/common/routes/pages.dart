import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/middlewares/library.dart';
import 'package:pinker/pages/application/library.dart';
import 'package:pinker/pages/initial/library.dart';
import 'package:pinker/pages/set/language/binding.dart';
import 'package:pinker/pages/set/language/view.dart';
import 'package:pinker/pages/set/library.dart';
import 'package:pinker/pages/unknown/library.dart';
import 'package:pinker/pages/welcome/binding.dart';
import 'package:pinker/pages/welcome/view.dart';

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
      binding: InitialBinding(),
      middlewares: [
        MiddlewareInitial(),
      ],
    ),
    GetPage(
      name: AppRoutes.application,
      page: () => const ApplicationView(),
      binding: ApplicationBinding(),
    ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRoutes.set,
      page: () => const SetView(),
      binding: SetBinding(),
      children: [
        GetPage(
          name: AppRoutes.setLanguage,
          page: () => const SetLanguageView(),
          binding: SetLanguageBinding(),
        ),
      ],
    ),
  ];
}
