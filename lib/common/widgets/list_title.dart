import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';

import 'package:pinker/common/widgets/library.dart';

Widget getListRight({
  required String icon,
  String? title,
  String? subtitle,
  void Function()? onTap,
}) {
  var iconRight = MyIcons.right();

  return ListTile(
    contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    leading: SvgPicture.asset('assets/svg/$icon.svg'),
    title: MyText.title(title ?? ''),
    subtitle: subtitle == null ? null : MyText(subtitle),
    trailing: subtitle == null
        ? iconRight
        : Row(
            children: [
              MyText(subtitle),
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
    title: MyText(title!),
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
    title: MyText(title!),
    trailing: isCheck ? MyIcons.check_2() : MyIcons.check_1(),
    onTap: onTap,
  );
}
