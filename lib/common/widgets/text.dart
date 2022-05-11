import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pinker/common/global/library.dart';

class MyText extends StatelessWidget {
  const MyText(
    this.data, {
    Key? key,
    this.maxLines,
    this.textAlign = TextAlign.center,
    this.overflow = TextOverflow.clip,
    this.colors,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  final String data;
  final int? maxLines;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final List<Color>? colors;
  final double fontSize;
  final FontWeight fontWeight;

  /// 32号的动态字体
  static MyText obxWelcom(String data) {
    const colors = [Colors.black, Colors.white];
    return MyText(
      data,
      fontSize: 32,
      colors: colors,
    );
  }

  /// 16号的动态字体
  static MyText obxOpcity(String data) {
    const colors = [Colors.black, Colors.white70];
    return MyText(
      data,
      colors: colors,
    );
  }

  /// 18号的静态字体
  static MyText title(String data) => MyText(data, fontSize: 18);

  @override
  Widget build(BuildContext context) {
    var color = Colors.black;

    if (colors != null && colors!.length == 1) color = colors![0];

    Text text(Color textColor) {
      var textStyle = TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );

      return Text(
        data,
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        softWrap: true,
        style: textStyle,
      );
    }

    Widget obxBuild() {
      color = ConfigStore.to.isLightMode ? colors![0] : colors![1];
      return text(color);
    }

    return colors == null || colors!.length <= 1 ? text(color) : Obx(obxBuild);
  }
}
