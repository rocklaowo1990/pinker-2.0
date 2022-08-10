import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/api/library.dart';
import 'package:pinker/common/constant/storage.dart';
import 'package:pinker/common/data/library.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/style/colors.dart';
import 'package:pinker/common/services/storage.dart';
import 'package:pinker/pages/video_play/library.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:wakelock/wakelock.dart';

class VideoPlayController extends GetxController {
  final state = VideoPlayState();

  final pageController = PageController();

  final ResourceData arguments = Get.arguments;

  final scrollController = ScrollController();

  bool isFavorites = false;

  final customControls = const CupertinoControls(
    backgroundColor: MyColors.input,
    iconColor: MyColors.text,
  );

  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  void guessPlay(ResourceData resourceData) async {
    if (resourceData.id == state.resourceData.value.id) return;

    if (scrollController.offset > 0) {
      await scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }

    if (videoPlayerController.value.isInitialized) {
      isFavorites = false;
      await videoPlayerController.dispose();
      chewieController.dispose();
      state.pageIndex.value = 0;
      state.chooise = [0, 0];
      state.resourceData.value = resourceData;
      state.resourceData.update((val) {});
      for (var data in ResourceController.to.favoritesId) {
        if (data == resourceData.id.toString()) isFavorites = true;
      }
      await videoPlay(resourceData.playUrls[0].urls[0]);
    }
  }

  void listener() async {
    if (!chewieController.isFullScreen) {
      await ConfigController.to.setPreferredOrientations();
      if (ConfigController.to.platform == 'android') {
        await ConfigController.to.getTransparentStatusBar();
      }
    }
  }

  Future<void> videoPlay(String url) async {
    state.isShowLoading = true;

    videoPlayerController = VideoPlayerController.network(url);
    try {
      await videoPlayerController.initialize();

      if (videoPlayerController.value.isInitialized) {
        chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          autoPlay: true,
          customControls: customControls,
        );

        state.isShowLoading = false;

        chewieController.addListener(listener);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getResourceList(int guessId) async {
    var getResoureList = await ResourceApi.getResourceList(
      type: 1,
      guessId: guessId,
    );

    if (getResoureList != null && getResoureList.code == 200) {
      var resoureList = ResourceDataList.fromJson(getResoureList.data);

      state.resourceList.update((val) {
        val!.list = resoureList.list;
        val.size = resoureList.size;
      });

      state.isRetry = false;
    } else {
      state.isRetry = true;
    }
  }

  Future<bool> onFavorites(bool value) async {
    isFavorites = !isFavorites;
    var favoritesId = ResourceController.to.favoritesId;

    if (isFavorites) {
      favoritesId.add(state.resourceData.value.id.toString());
      ResourceController.to.favoritesList.update((val) {
        val!.list.add(state.resourceData.value);
        val.size += 1;
      });
    } else {
      favoritesId.remove(state.resourceData.value.id.toString());
      ResourceController.to.favoritesList.update((val) {
        val!.list.remove(state.resourceData.value);
        val.size -= 1;
      });
    }

    MyStorageService.to.setList(storageFavoritesIdKey, favoritesId);
    return isFavorites;
  }

  @override
  void onInit() {
    super.onInit();
    state.resourceData.value = arguments;
    state.resourceData.update((value) {});

    // state.isLoading = false;

    for (var data in ResourceController.to.favoritesId) {
      if (data == state.resourceData.value.id.toString()) isFavorites = true;
    }
  }

  @override
  void onReady() async {
    super.onReady();

    Wakelock.enable();

    getResourceList(state.resourceData.value.id);
    videoPlay(state.resourceData.value.playUrls[0].urls[0]);
  }

  @override
  void onClose() {
    videoPlayerController.dispose();

    if (videoPlayerController.value.isInitialized) {
      chewieController.removeListener(listener);
      chewieController.dispose();
    }

    Wakelock.disable();

    super.onClose();
  }
}
