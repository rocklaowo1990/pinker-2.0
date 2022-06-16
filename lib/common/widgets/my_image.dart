import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pinker/common/style/library.dart';
import 'package:pinker/common/widgets/my_icons.dart';

class MyImage extends StatelessWidget {
  const MyImage({
    Key? key,
    required this.imageUrl,
    this.width = 55.0,
    this.height = 55.0,
    this.borderRadius = MyStyle.borderRadius,
  }) : super(key: key);

  final String imageUrl;
  final double width;
  final double height;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    // Widget placeholder(context, url) {
    //   return MyIcons.lottie('home');
    // }

    Widget errorWidget(context, url, erro) {
      return Container(
        width: width,
        height: height,
        color: MyColors.input,
      );
    }

    Widget progressIndicatorBuilder(context, url, value) {
      return MyIcons.lottie('image_holder', fit: BoxFit.fill);
    }

    var imageBox = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      // placeholder: placeholder,
      errorWidget: errorWidget,
      progressIndicatorBuilder: progressIndicatorBuilder,
      fadeInDuration: const Duration(milliseconds: 2000),
    );

    var decoration = BoxDecoration(
      borderRadius: borderRadius,
      shape: BoxShape.rectangle,
    );

    return Container(
      width: width,
      height: height,
      decoration: decoration,
      clipBehavior: Clip.antiAlias,
      child: imageBox,
    );
  }
}
