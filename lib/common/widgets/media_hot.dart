import 'package:flutter/material.dart';
import 'package:pinker/common/data/library.dart';
import 'package:pinker/common/widgets/library.dart';

class MediaHot extends StatelessWidget {
  const MediaHot({
    Key? key,
    required this.resourceData,
  }) : super(key: key);

  final ResourceData resourceData;

  @override
  Widget build(BuildContext context) {
    var left = MyImage(
      imageUrl: resourceData.image,
      width: 150,
      height: 100,
    );

    var nameBox = MyText(resourceData.name);

    var centerChildren = [
      const SizedBox(height: 8),
      nameBox,
      if (resourceData.introduction != null)
        MyText.gray14(resourceData.introduction!),
    ];

    var sizedColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: centerChildren,
    );

    var center = SizedBox(height: 90, child: sizedColumn);

    var leftRowChildren = [
      left,
      const SizedBox(width: 10),
      Expanded(child: center),
    ];

    var leftRow = Row(children: leftRowChildren);

    var bodyChildren = [
      Expanded(child: leftRow),
      const SizedBox(width: 20),
      MyIcons.play(),
    ];

    var bodyButton = MyButton(
      child: Row(children: bodyChildren),
      onTap: () {},
    );

    var columnChildren = [bodyButton, const SizedBox(height: 16)];

    return Column(children: columnChildren);
  }
}
