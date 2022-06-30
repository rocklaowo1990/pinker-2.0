import 'package:get/get.dart';
import 'package:pinker/common/middlewares/library.dart';
import 'package:pinker/pages/add_bank/binding.dart';
import 'package:pinker/pages/add_bank/view.dart';
import 'package:pinker/pages/add_usdt/binding.dart';
import 'package:pinker/pages/add_usdt/view.dart';
import 'package:pinker/pages/application/library.dart';
import 'package:pinker/pages/bank/binding.dart';
import 'package:pinker/pages/bank/view.dart';
import 'package:pinker/pages/favorites/library.dart';
import 'package:pinker/pages/initial/library.dart';
import 'package:pinker/pages/phone/binding.dart';
import 'package:pinker/pages/phone/view.dart';
import 'package:pinker/pages/search/library.dart';
import 'package:pinker/pages/set/language/library.dart';
import 'package:pinker/pages/set/library.dart';
import 'package:pinker/pages/unknown/library.dart';
import 'package:pinker/pages/video_play/binding.dart';
import 'package:pinker/pages/video_play/view.dart';
import 'package:pinker/pages/welcome/library.dart';
import 'names.dart';

class AppPages {
  /// 初始化路径
  static const initial = MyRoutes.initial;

  /// 历史路由
  static List<String> history = [];

  /// 未知页面
  static final unknownRoute = GetPage(
    name: MyRoutes.unknownRoute,
    page: () => const UnknownView(),
    binding: UnknownBinding(),
  );

  static final List<GetPage> getPages = [
    /// 初始化页面
    GetPage(
      name: MyRoutes.initial,
      page: () => const InitialView(),
      binding: InitialBinding(),
      middlewares: [
        MiddlewareInitial(),
      ],
    ),

    /// 视频播放页面
    GetPage(
      name: MyRoutes.videoPlay,
      page: () => const VideoPlayView(),
      binding: VideoPlayBinding(),
    ),

    /// 主页面
    GetPage(
      name: MyRoutes.application,
      page: () => const ApplicationView(),
      binding: ApplicationBinding(),
    ),

    /// 观看历史页面
    GetPage(
      name: MyRoutes.history,
      page: () => const FavoritesView(),
      binding: FavoritesBinding(),
    ),

    /// 欢迎页面
    GetPage(
      name: MyRoutes.welcome,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),

    /// 银行卡页面
    GetPage(
      name: MyRoutes.bank,
      page: () => const BankView(),
      binding: BankBinding(),
    ),

    /// 添加银行卡页面
    GetPage(
      name: MyRoutes.addBank,
      page: () => const AddBankView(),
      binding: AddBankBinding(),
    ),

    /// 手机页面
    GetPage(
      name: MyRoutes.phone,
      page: () => const PhoneView(),
      binding: PhoneBinding(),
    ),

    /// 添加USDT页面
    GetPage(
      name: MyRoutes.addUsdt,
      page: () => const AddUsdtView(),
      binding: AddUsdtBinding(),
    ),

    /// 搜索页面
    GetPage(
      name: MyRoutes.search,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),

    /// 设置页面
    GetPage(
      name: MyRoutes.set,
      page: () => const SetView(),
      binding: SetBinding(),
      children: [
        /// 设置语言
        GetPage(
          name: MyRoutes.setLanguage,
          page: () => const SetLanguageView(),
          binding: SetLanguageBinding(),
        ),
      ],
    ),
  ];
}
