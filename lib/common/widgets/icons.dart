import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget getIconLogo({Color? color}) {
  return SvgPicture.asset(
    'assets/svg/logo.svg',
    color: color,
  );
}

Widget getIconBack({Color? color}) {
  return SvgPicture.asset(
    'assets/svg/back.svg',
    color: color,
  );
}
