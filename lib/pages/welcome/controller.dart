import 'package:get/get.dart';
import 'package:pinker/common/api/library.dart';
import 'package:pinker/common/data/home_data.dart';
import 'package:pinker/common/data/library.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/routes/library.dart';
import 'package:pinker/pages/welcome/library.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();

  // void handleHome() async {
  //   /// 进入首页

  //   Get.offAllNamed(MyRoutes.application);

  //   if (getResourceList.statusCode == 200) {
  //     print(getResourceList);
  //     Get.offAllNamed(MyRoutes.application);
  //   }

  //   StorageService.to.setBool(storageIsHaveUsed, true);

  //   / 改变主题
  //   ConfigStore.to.isLightMode = !ConfigStore.to.isLightMode;
  //   StorageService.to.setBool(
  //     storageIsLightModeKey,
  //     ConfigStore.to.isLightMode,
  //   );
  //   ConfigStore.changeSystem();

  //   / 更改语言
  //   const zhCN = Locale('zh', 'CN');
  //   const enUS = Locale('en', 'US');
  //   Get.updateLocale(Get.locale == zhCN ? enUS : zhCN);
  // }

  Future<void> getData({
    required int type,
    required Rx<HomeData> homeDataRx,
    required Rx<ResourceDataList> homeMediaListRx,
  }) async {
    var getHomeData = await HomeApi.getHomeData(type: type);
    var homeData = HomeData.fromJson(getHomeData.data);
    if (getHomeData.code == 200) {
      homeDataRx.update((val) {
        val!.banner = homeData.banner;
        val.types = homeData.types;
      });
    }

    var getHomeMediaList = await ResourceApi.getResourceList(
      pageNo: type,
      type: 1,
      pageSize: 15,
    );
    var homeMediaList = ResourceDataList.fromJson(getHomeMediaList.data);
    if (getHomeMediaList.code == 200) {
      homeMediaListRx.update((val) {
        val!.list = homeMediaList.list;
        val.size = homeMediaList.size;
      });
    }
  }

  @override
  void onReady() async {
    super.onReady();

    await getData(
      type: 0,
      homeDataRx: ResourceController.to.homeMoveData,
      homeMediaListRx: ResourceController.to.homeMoiveList,
    );

    state.loadingValue = 0.25;

    await getData(
      type: 1,
      homeDataRx: ResourceController.to.homeDramaData,
      homeMediaListRx: ResourceController.to.homeDramaList,
    );

    state.loadingValue = 0.3;

    await getData(
      type: 2,
      homeDataRx: ResourceController.to.homeShowData,
      homeMediaListRx: ResourceController.to.homeShowList,
    );

    state.loadingValue = 0.5;

    await getData(
      type: 3,
      homeDataRx: ResourceController.to.homeCartoonData,
      homeMediaListRx: ResourceController.to.homeCartoonList,
    );

    state.loadingValue = 0.6;

    await getData(
      type: 4,
      homeDataRx: ResourceController.to.homeSexData,
      homeMediaListRx: ResourceController.to.homeSexList,
    );

    state.loadingValue = 0.8;

    var getSearchWord = await HomeApi.getSearchWord();
    var searchWord = SearchWordData.fromJson(getSearchWord.data);

    if (getSearchWord.code == 200) {
      ResourceController.to.searchWord = searchWord.searchWord;
    }

    state.loadingValue = 0.9;

    var getType = await ResourceApi.getType();
    var types = TypeList.fromJson(getType.data);

    if (getType.code == 200) {
      ResourceController.to.types.update((val) {
        val!.list = types.list;
        val.size = types.size;
      });
    }

    state.loadingValue = 1;

    Get.offAllNamed(MyRoutes.application);
  }
}
