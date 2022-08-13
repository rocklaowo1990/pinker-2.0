import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/constant/storage.dart';
import 'package:pinker/common/data/library.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/routes/library.dart';
import 'package:pinker/common/services/librart.dart';
import 'package:pinker/common/services/storage.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/application/my/library.dart';

class MyController extends GetxController {
  final state = MyState();

  final scrollController = ScrollController();

  void history() => Get.toNamed(MyRoutes.history);

  void recharge() {}

  void pick() {}

  void login() {
    ConfigController.to.getDaliog(
      child: DialogChild.signIn(),
    );
  }

  void bank() {
    if (UserController.to.token.isNotEmpty) {
      Get.toNamed(MyRoutes.bank);
    } else {
      login();
    }
  }

  void loginOut() {
    final isLoading = false.obs;

    void _onTap() async {
      isLoading.value = true;

      UserController.to.token = '';

      await MyStorageService.to.remove(storageUserTokenKey);
      UserController.to.userInfo.value = UserInfo.fromJson(UserInfo.child);
      UserController.to.userInfo.update((val) {});

      Get.back();
      ConfigController.to.getSnakBar('操作成功', '您已成功退出登陆');
    }

    var alert = DialogChild.alert(
      title: '退出登陆',
      content: '是否确认继续操作',
      onTap: _onTap,
    );

    var loading = DialogChild.loading();

    ConfigController.to
        .getDaliog(child: Obx(() => isLoading.value ? loading : alert));
  }

  void phone() {
    if (UserController.to.token.isNotEmpty) {
      Get.toNamed(MyRoutes.phone);
    } else {
      login();
    }
  }

  void password() {
    if (UserController.to.token.isNotEmpty) {
      Get.toNamed(MyRoutes.phone);
    } else {
      login();
    }
  }

  @override
  void onReady() {
    super.onReady();
    scrollController.addListener(() {
      state.opacity = scrollController.offset / 10;
      state.scrollOffset = scrollController.offset;
      if (state.opacity > 1.0) state.opacity = 1.0;
      if (state.opacity < 0.0) state.opacity = 0.0;
    });
  }
}
