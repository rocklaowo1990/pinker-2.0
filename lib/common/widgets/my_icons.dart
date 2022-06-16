import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:pinker/common/style/colors.dart';

class MyIcons {
  static Widget play() => SvgPicture.asset('assets/svg/play.svg');

  static Widget diamond() => SvgPicture.asset('assets/svg/diamond.svg');

  static Widget right() => SvgPicture.asset('assets/svg/right.svg');

  static Widget back() => SvgPicture.asset('assets/svg/back.svg');

  static Widget set() => SvgPicture.asset('assets/svg/set.svg');

  static Widget check_1() => SvgPicture.asset('assets/svg/check_1.svg');

  static Widget check_2() => SvgPicture.asset('assets/svg/check_2.svg');

  static Widget customer() => SvgPicture.asset('assets/svg/my_customer.svg');

  static Widget emial() => SvgPicture.asset('assets/svg/my_email.svg');

  static Widget bank() => Image.asset('assets/images/my_bank.png', width: 28);

  static Widget phone() => Image.asset('assets/images/my_phone.png', width: 28);

  static Widget exit() => Image.asset('assets/images/my_exit.png', width: 28);

  static Widget password() {
    return Image.asset('assets/images/my_password.png', width: 28);
  }

  static Widget broken() {
    return Image.asset('assets/images/my_broken.png', width: 28);
  }

  static Widget logo() {
    return SvgPicture.asset('assets/svg/logo.svg', color: Colors.green);
  }

  static Widget lottie(String url, {BoxFit? fit}) {
    return LottieBuilder.asset(
      'assets/lottie/$url.zip',
      fit: fit ?? BoxFit.fitWidth,
    );
  }

  static Widget close() {
    return const Icon(Icons.cancel, color: MyColors.primary, size: 16);
  }

  static Widget search() {
    var icon = SvgPicture.asset('assets/svg/search.svg', height: 20, width: 20);
    return SizedBox(child: Center(child: icon), height: 20, width: 20);
  }

  static Widget history() {
    return Image.asset('assets/images/my_history.png', width: 28);
  }

  static Widget loading() {
    const loadingBox = CircularProgressIndicator(
      backgroundColor: MyColors.secondText,
      color: MyColors.primary,
      strokeWidth: 2,
    );

    const child = SizedBox(width: 20, height: 20, child: loadingBox);

    return const Center(child: child);
  }
}