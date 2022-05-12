import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/utils/library.dart';
import 'package:pinker/pages/application/act/library.dart';
import 'package:pinker/pages/application/community/library.dart';
import 'package:pinker/pages/application/home/aldult/library.dart';
import 'package:pinker/pages/application/home/cartoon/library.dart';
import 'package:pinker/pages/application/home/drama/library.dart';
import 'package:pinker/pages/application/home/library.dart';
import 'package:pinker/pages/application/home/movie/library.dart';
import 'package:pinker/pages/application/home/show/library.dart';
import 'package:pinker/pages/application/my/library.dart';

/// 全局静态数据
class Global {
  /// 初始化
  static Future init() async {
    /// 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    //显示顶部栏(隐藏底部栏，没有这个的话底部状态栏的透明度无法实现)
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    // 强制竖屏
    var option = [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown];
    await SystemChrome.setPreferredOrientations(option);

    // 硬盘储存初始化
    await Get.putAsync<StorageService>(() => StorageService().init());

    // 导入用户全局 和 系统全局
    // config：是系统信息
    // user：用户信息
    Get.put<ConfigStore>(ConfigStore());
    Get.put<UserStore>(UserStore());

    Get.put<HomeController>(HomeController());
    Get.put<CommunityController>(CommunityController());
    Get.put<ActController>(ActController());
    Get.put<MyController>(MyController());

    Get.put<MovieController>(MovieController());
    Get.put<DramaController>(DramaController());
    Get.put<CartoomController>(CartoomController());
    Get.put<AldultController>(AldultController());
    Get.put<ShowController>(ShowController());

    // Get.lazyPut<MovieController>(() => MovieController());
    // Get.lazyPut<DramaController>(() => DramaController());
    // Get.lazyPut<CartoomController>(() => CartoomController());
    // Get.lazyPut<AldultController>(() => AldultController());
    // Get.lazyPut<ShowController>(() => ShowController());

    // Get.lazyPut<ConfigStore>(() => ConfigStore());
    // Get.lazyPut<UserStore>(() => UserStore());

    // Get.lazyPut<HomeController>(() => HomeController());
    // Get.lazyPut<CommunityController>(() => CommunityController());
    // Get.lazyPut<ActController>(() => ActController());
    // Get.lazyPut<MyController>(() => MyController());
  }
}
