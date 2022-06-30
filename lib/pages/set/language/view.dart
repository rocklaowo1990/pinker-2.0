import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/widgets/library.dart';
import 'package:pinker/pages/set/language/library.dart';

class SetLanguageView extends GetView<SetLanguageController> {
  const SetLanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBar = const MyAppBar();

    var body = ListView(
      children: [
        SizedBox(
          child: Column(
            children: ListTile.divideTiles(
              tiles: [],
              context: context,
              color: Colors.black12,
            ).toList(),
          ),
        ),
      ],
    );

    return MyScaffold(
      header: appBar,
      body: body,
    );
  }
}
