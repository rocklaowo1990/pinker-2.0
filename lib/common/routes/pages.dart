import 'package:get/get.dart';
import 'package:pinker/pages/add_bank/binding.dart';
import 'package:pinker/pages/add_bank/view.dart';
import 'package:pinker/pages/add_usdt/binding.dart';
import 'package:pinker/pages/add_usdt/view.dart';
import 'package:pinker/pages/application/library.dart';
import 'package:pinker/pages/bank/binding.dart';
import 'package:pinker/pages/bank/view.dart';
import 'package:pinker/pages/edit_password/binding.dart';
import 'package:pinker/pages/edit_password/view.dart';
import 'package:pinker/pages/favorites/library.dart';
import 'package:pinker/pages/phone/add_edit_phone/binding.dart';
import 'package:pinker/pages/phone/add_edit_phone/view.dart';
import 'package:pinker/pages/phone/binding.dart';
import 'package:pinker/pages/phone/view.dart';
import 'package:pinker/pages/search/library.dart';
import 'package:pinker/pages/unknown/library.dart';
import 'package:pinker/pages/video_play/binding.dart';
import 'package:pinker/pages/video_play/view.dart';
import 'package:pinker/pages/welcome/library.dart';
import 'names.dart';

class AppPages {
  /// 未知页面
  static final unknownRoute = GetPage(
    name: MyRoutes.unknownRoute,
    page: () => const UnknownView(),
    binding: UnknownBinding(),
  );

  static final List<GetPage> getPages = [
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

    /// 修改密码
    GetPage(
      name: MyRoutes.editPassword,
      page: () => const EditPasswordView(),
      binding: EditPasswordBinding(),
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
      children: [
        /// 更改或添加手机
        GetPage(
          name: MyRoutes.addOrEditPhone,
          page: () => const AddOrEditPhoneView(),
          binding: AddOrEditPhoneBinding(),
        ),
      ],
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
  ];
}
