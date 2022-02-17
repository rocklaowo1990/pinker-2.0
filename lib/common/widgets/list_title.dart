import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';
import 'package:pinker/common/class/library.dart';

import 'package:pinker/common/widgets/library.dart';

Widget getListRight({
  required String icon,
  String? title,
  String? subtitle,
  void Function()? onTap,
}) {
  var iconRight = AppIcons.right;

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
  required RxBool isCheck,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.fromLTRB(20, 0, 8, 0),
    leading: SvgPicture.asset('assets/svg/$icon.svg'),
    title: getText(title),
    trailing: Obx(
      () => Switch(
        value: isCheck.value,
        onChanged: onChanged,
      ),
    ),
  );
}

Widget getListCheck({
  String? icon,
  String? title,
  required void Function()? onTap,
  required bool isCheck,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    leading: icon != null ? SvgPicture.asset('assets/svg/$icon.svg') : null,
    title: getText(title),
    trailing: isCheck ? AppIcons.check_2 : AppIcons.check_1,
    onTap: onTap,
  );
}
