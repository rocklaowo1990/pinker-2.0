import 'package:get/get.dart';
import 'package:pinker/common/api/library.dart';
import 'package:pinker/common/data/home_data.dart';
import 'package:pinker/common/data/library.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/routes/library.dart';
import 'package:pinker/pages/welcome/library.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();

  Future<void> getType() async {
    var _getType = await ResourceApi.getType(
      errorCallBack: ConfigController.to.errorDaliog,
    );

    if (_getType != null && _getType.code == 200) {
      var types = TypeList.fromJson(_getType.data);

      ResourceController.to.types.update((val) {
        val!.list = types.list;
        val.size = types.size;
      });
    } else {
      await getType();
    }
  }

  /// 获取用户信息
  Future<void> getUserInfo() async {
    var _getUserInfo = await UserApi.getUserInfo(
      errorCallBack: ConfigController.to.errorDaliog,
    );

    if (_getUserInfo != null && _getUserInfo.code == 200) {
      var userInfo = UserInfo.fromJson(_getUserInfo.data);
      UserController.to.userInfo.value = userInfo;
      UserController.to.userInfo.update((val) {});
    } else {
      await getUserInfo();
    }
  }

  Future<void> getSearchWord() async {
    var _getSearchWord = await HomeApi.getSearchWord(
      errorCallBack: ConfigController.to.errorDaliog,
    );

    if (_getSearchWord != null && _getSearchWord.code == 200) {
      var searchWord = SearchWordData.fromJson(_getSearchWord.data);
      ResourceController.to.searchWord = searchWord.searchWord;
    } else {
      await getSearchWord();
    }
  }

  Future<void> getData({
    required int type,
    required Rx<HomeData> homeDataRx,
    required Rx<ResourceDataList> homeMediaListRx,
  }) async {
    var getHomeData = await HomeApi.getHomeData(
      type: type,
      errorCallBack: ConfigController.to.errorDaliog,
    );

    if (getHomeData != null && getHomeData.code == 200) {
      var homeData = HomeData.fromJson(getHomeData.data);

      homeDataRx.update((val) {
        val!.banner = homeData.banner;
        val.types = homeData.types;
      });

      var getHomeMediaList = await ResourceApi.getResourceList(
        pageNo: type,
        type: 1,
        pageSize: 15,
        errorCallBack: ConfigController.to.errorDaliog,
      );

      if (getHomeMediaList != null && getHomeMediaList.code == 200) {
        var homeMediaList = ResourceDataList.fromJson(getHomeMediaList.data);

        homeMediaListRx.update((val) {
          val!.list = homeMediaList.list;
          val.size = homeMediaList.size;
        });
      } else {
        await getData(
          type: type,
          homeDataRx: homeDataRx,
          homeMediaListRx: homeMediaListRx,
        );
      }
    } else {
      await getData(
        type: type,
        homeDataRx: homeDataRx,
        homeMediaListRx: homeMediaListRx,
      );
    }
  }

  @override
  void onReady() async {
    super.onReady();

    await getData(
      type: 0,
      homeDataRx: ResourceController.to.homeMoiveData,
      homeMediaListRx: ResourceController.to.homeMoiveList,
    );

    state.loadingValue = 0.2;

    await getData(
      type: 1,
      homeDataRx: ResourceController.to.homeDramaData,
      homeMediaListRx: ResourceController.to.homeDramaList,
    );

    state.loadingValue = 0.7;

    await getData(
      type: 2,
      homeDataRx: ResourceController.to.homeShowData,
      homeMediaListRx: ResourceController.to.homeShowList,
    );

    state.loadingValue = 0.75;

    await getData(
      type: 3,
      homeDataRx: ResourceController.to.homeCartoonData,
      homeMediaListRx: ResourceController.to.homeCartoonList,
    );

    state.loadingValue = 0.8;

    await getData(
      type: 4,
      homeDataRx: ResourceController.to.homeSexData,
      homeMediaListRx: ResourceController.to.homeSexList,
    );

    state.loadingValue = 0.85;

    await getSearchWord();

    state.loadingValue = 0.9;

    await getType();

    state.loadingValue = 0.95;

    if (UserController.to.token != '') await getUserInfo();

    state.loadingValue = 1;

    Get.offAllNamed(MyRoutes.application);
  }
}
