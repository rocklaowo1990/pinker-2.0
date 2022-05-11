import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/theme/colors.dart';
import 'package:pinker/common/theme/library.dart';

class MyIcons {
  static Widget logo() {
    return SvgPicture.asset(
      'assets/svg/logo.svg',
      color: AppColors.primaryColor,
    );
  }

  static Widget play() => SvgPicture.asset('assets/svg/play.svg');

  static Widget right() {
    Widget obxBuild() {
      var color = ConfigStore.to.isLightMode ? Colors.black : Colors.white;
      return SvgPicture.asset(
        'assets/svg/right.svg',
        color: color,
      );
    }

    return Obx(obxBuild);
  }

  static Widget back() {
    Widget obxBuild() {
      var color = ConfigStore.to.isLightMode ? Colors.black : Colors.white;
      return SvgPicture.asset(
        'assets/svg/back.svg',
        color: color,
      );
    }

    return Obx(obxBuild);
  }

  static Widget set() {
    Widget obxBuild() {
      var color = ConfigStore.to.isLightMode ? Colors.black : Colors.white;
      return SvgPicture.asset(
        'assets/svg/set.svg',
        color: color,
      );
    }

    return Obx(obxBuild);
  }

  static Widget check_1() {
    Widget obxBuild() {
      var color = ConfigStore.to.isLightMode ? Colors.black : Colors.white;
      return SvgPicture.asset(
        'assets/svg/check_1.svg',
        color: color,
      );
    }

    return Obx(obxBuild);
  }

  static Widget check_2() {
    Widget obxBuild() {
      var color = ConfigStore.to.isLightMode ? Colors.black : Colors.white;
      return SvgPicture.asset(
        'assets/svg/check_2.svg',
        color: color,
      );
    }

    return Obx(obxBuild);
  }
}
