import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';
import 'package:pinker/common/store/library.dart';
import 'package:pinker/common/theme/library.dart';
import 'package:pinker/common/widgets/library.dart';

Widget getListRight({
  required String icon,
  String? title,
  String? subtitle,
  void Function()? onTap,
}) {
  var iconRight = Obx(
    () => SvgPicture.asset(
      'assets/svg/right.svg',
      color: ConfigStore.to.state.isDarkMode
          ? LightColor.scaffoldBackground
          : DarkColor.scaffoldBackground,
      height: 14,
      width: 14,
    ),
  );
  return ListTile(
    contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    leading: SvgPicture.asset('assets/svg/$icon.svg'),
    title: getText(title),
    subtitle: subtitle == null ? null : getText(subtitle),
    trailing: subtitle == null
        ? iconRight
        : Row(
            children: [
              getText(subtitle),
              const SizedBox(width: 10),
              iconRight,
            ],
          ),
    onTap: onTap,
  );
}

Widget getListSwitch({
  required String icon,
  String? title,
  required void Function(bool)? onChanged,
  required RxBool isChooise,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.fromLTRB(20, 0, 8, 0),
    leading: SvgPicture.asset('assets/svg/$icon.svg'),
    title: getText(title),
    trailing: Obx(
      () => Switch(
        value: isChooise.value,
        onChanged: onChanged,
      ),
    ),
  );
}
