import 'package:get/get.dart';
import 'package:pinker/common/data/library.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/style/colors.dart';
import 'package:pinker/pages/video_play/library.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayController extends GetxController {
  final state = VideoPlayState();

  final ResourceData arguments = Get.arguments;

  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  void listener() async {
    if (!chewieController.isFullScreen) {
      ConfigController.getTransparentStatusBar(isTransparent: false);
    }
  }

  @override
  void onReady() async {
    super.onReady();

    videoPlayerController = VideoPlayerController.network(
      arguments.playUrls[0],
    );

    await videoPlayerController.initialize();

    state.isShowLoading = false;

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      showOptions: false,
      customControls: const CupertinoControls(
        backgroundColor: MyColors.input,
        iconColor: MyColors.text,
      ),
    );

    chewieController.addListener(listener);
  }

  @override
  void onClose() {
    videoPlayerController.dispose();

    if (videoPlayerController.value.isInitialized) {
      chewieController.removeListener(listener);
      chewieController.dispose();
    }

    super.onClose();
  }
}
