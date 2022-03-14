import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pinker/common/public/library.dart';
import 'package:pinker/common/theme/colors.dart';
import 'package:pinker/common/theme/library.dart';

class AppIcons {
  static final logo = _getSvg('logo', color: AppColors.primaryColor);

  static final right = _getSvg('right');

  static final back = _getSvg('back');

  static final set = _getSvg('set');

  static final check_1 = _getSvg('check_1', isObx: false);

  static final check_2 = _getSvg('check_2', isObx: false);

  static Widget _getSvg(
    String svg, {
    Color? color,
    bool isObx = true,
  }) {
    return isObx
        ? color == null
            ? Obx(
                () => SvgPicture.asset(
                  'assets/svg/$svg.svg',
                  color: ConfigStore.to.state.isDarkMode
                      ? LightColor.scaffoldBackground
                      : DarkColor.scaffoldBackground,
                ),
              )
            : SvgPicture.asset('assets/svg/$svg.svg', color: color)
        : SvgPicture.asset('assets/svg/$svg.svg');
  }
}
