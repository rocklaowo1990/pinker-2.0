import 'package:get/get.dart';
import 'package:pinker/common/api/library.dart';
import 'package:pinker/common/data/library.dart';
import 'package:pinker/pages/application/community/drama/library.dart';

class CommunityDramaController extends GetxController {
  final state = CommunityDramaState();
  final type = 1;

  List<int> chooseIndex = [];

  void typesClick(int typeIndex, String typaName, int index) {
    state.isRetry = false;

    chooseIndex[typeIndex] = index;

    state.data.update((val) {
      val!.country = index;
    });
  }

  Future<void> getMedias({
    required int type,
    int? mediaType,
    int? pageNo,
    int? pageSize,
    int? country,
    String? keyword,
    int? year,
    int? sort,
  }) async {
    var getMedias = await ResourceApi.getResourceList(
      type: type,
      mediaType: mediaType,
      pageNo: pageNo,
      pageSize: pageSize,
      country: country,
      keyword: keyword,
      year: year,
      sort: sort,
    );

    if (getMedias != null && getMedias.code == 200) {
      var medias = ResourceDataList.fromJson(getMedias.data);

      state.resourceList.update((val) {
        val!.list = medias.list;
        val.size = medias.size;
      });

      state.isRetry = false;
    } else {
      state.isRetry = true;
    }
  }

  Future<void> getTypes() async {
    var getTypes = await ResourceApi.getResourceType();

    if (getTypes != null && getTypes.code == 200) {
      var types = MediaTypeList.fromJson(getTypes.data);

      state.mediaTypeList.update((val) {
        val!.list = types.list;
        val.size = types.size;
      });

      for (int i = 0; i < state.mediaTypeList.value.list.length; i++) {
        chooseIndex.add(0);
      }
    }
  }

  @override
  void onReady() async {
    super.onReady();

    await getTypes();

    await getMedias(type: type);

    debounce(state.data, (ResourceResponseData value) async {
      state.resourceList.update((val) {
        val!.list.clear();
        val.size = 0;
      });

      await getMedias(
        type: value.type,
        mediaType: value.mediaType,
        pageNo: value.pageNo,
        pageSize: value.pageSize,
        country: value.country,
        keyword: value.keyword,
        year: value.year,
        sort: value.sort,
      );
    }, time: const Duration(milliseconds: 1500));
  }
}
