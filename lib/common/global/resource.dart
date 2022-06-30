import 'package:get/get.dart';
import 'package:pinker/common/constant/storage.dart';
import 'package:pinker/common/data/home_data.dart';
import 'package:pinker/common/data/library.dart';
import 'package:pinker/common/routes/library.dart';
import 'package:pinker/common/services/librart.dart';

class ResourceController extends GetxController {
  static ResourceController get to => Get.find();

  /// 首页电影列表
  /// 首页电影数据
  final homeMoiveData = HomeData.fromJson(HomeData.child).obs;
  final homeMoiveList = ResourceDataList.fromJson(ResourceDataList.child).obs;

  /// 成人影院
  final homeSexData = HomeData.fromJson(HomeData.child).obs;
  final homeSexList = ResourceDataList.fromJson(ResourceDataList.child).obs;

  /// 电视剧
  final homeDramaData = HomeData.fromJson(HomeData.child).obs;
  final homeDramaList = ResourceDataList.fromJson(ResourceDataList.child).obs;

  /// 综艺
  final homeShowData = HomeData.fromJson(HomeData.child).obs;
  final homeShowList = ResourceDataList.fromJson(ResourceDataList.child).obs;

  /// 动漫
  final homeCartoonData = HomeData.fromJson(HomeData.child).obs;
  final homeCartoonList = ResourceDataList.fromJson(ResourceDataList.child).obs;

  /// 搜索关键字
  String searchWord = '';

  /// 影片类型的名称
  final types = TypeList.fromJson(TypeList.child).obs;

  /// 视频播放
  static void videoPlay(ResourceData resourceData) {
    Get.toNamed(MyRoutes.videoPlay, arguments: resourceData);
  }

  /// 观看历史
  final favoritesId = MyStorageService.to.getList(storageFavoritesIdKey).obs;
}
