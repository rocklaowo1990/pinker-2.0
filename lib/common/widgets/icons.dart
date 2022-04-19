import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/theme/colors.dart';
import 'package:pinker/common/theme/library.dart';

class MyIcons extends StatelessWidget {
  const MyIcons(
    this.icons, {
    Key? key,
    this.colors,
    this.isSvg = true,
  }) : super(key: key);

  final List<String> icons;
  final List<Color>? colors;
  final bool isSvg;

  static MyIcons logo() =>
      const MyIcons(['logo.svg'], colors: [AppColors.primaryColor]);

  static MyIcons right() =>
      const MyIcons(['right.svg'], colors: [Colors.white, Colors.black]);

  static MyIcons back() =>
      const MyIcons(['back.svg'], colors: [Colors.white, Colors.black]);

  static MyIcons set() =>
      const MyIcons(['set.svg'], colors: [Colors.white, Colors.black]);

  static MyIcons check_1() =>
      const MyIcons(['check_1.svg'], colors: [Colors.white]);

  static MyIcons check_2() =>
      const MyIcons(['check_2.svg'], colors: [Colors.white]);

  @override
  Widget build(BuildContext context) {
    Widget _getColorSvg() => ConfigStore.to.isDarkMode
        ? SvgPicture.asset('assets/svg/${icons[0]}', color: colors![0])
        : SvgPicture.asset('assets/svg/${icons[0]}', color: colors![1]);

    Widget _getSvgs() => ConfigStore.to.isDarkMode
        ? SvgPicture.asset('assets/svg/${icons[0]}')
        : SvgPicture.asset('assets/svg/${icons[1]}');

    Widget _getImages() => ConfigStore.to.isDarkMode
        ? Image.asset('assets/images/${icons[0]}')
        : Image.asset('assets/images/${icons[1]}');

    /// 没有传入任何图标路径
    if (icons.isEmpty) {
      return const SizedBox();
    }

    /// 传入了一个图标路径
    else if (icons.length < 2) {
      /// 如果是svg图标，则需要考虑传入的颜色
      if (isSvg) {
        /// 没有传入颜色，或者传入的是空颜色数组
        if (colors == null || colors!.isEmpty) {
          return SvgPicture.asset('assets/svg/${icons[0]}');
        }

        /// 如果是传入了一个颜色
        else if (colors!.length < 2) {
          return SvgPicture.asset(
            'assets/svg/${icons[0]}',
            color: colors![0],
          );
        }

        /// 传入了多个颜色
        else {
          return Obx(_getColorSvg);
        }
      }

      /// 图片也是不需要考虑颜色的
      else {
        return Image.asset('assets/images/${icons[0]}');
      }
    }

    /// 传入了多个图标路径
    /// 这个时候是不用管传入的颜色
    else {
      return isSvg ? Obx(_getSvgs) : Obx(_getImages);
    }
  }
}
