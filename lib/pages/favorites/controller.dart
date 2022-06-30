import 'package:get/get.dart';
import 'package:pinker/common/api/library.dart';
import 'package:pinker/common/data/library.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/utils/library.dart';

import 'package:pinker/pages/favorites/library.dart';

class FavoritesController extends GetxController {
  final state = FavoritesState();

  Future<void> getResourceData() async {
    if (ResourceController.to.favoritesId.isEmpty) {
      state.isLoading = false;
    } else {
      state.isLoading = true;

      for (var item in ResourceController.to.favoritesId) {
        int id = int.fromEnvironment(item);
        var getResourceData = await ResourceApi.getResourceData(id: id);

        if (getResourceData != null && getResourceData.code == 200) {
          var resourceData = ResourceData.fromJson(getResourceData.data);

          state.history.update((val) {
            val!.list.add(resourceData);
            val.size += 1;
          });

          state.isRetry = false;
        } else {
          state.isRetry = true;
        }
      }

      state.isLoading = false;
    }
  }

  @override
  void onReady() async {
    super.onReady();

    await MyTimer.futureMill(500);
    await getResourceData();
  }
}
