import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView({
    Key? key,
    this.controller,
    this.children = const <Widget>[],
    this.padding,
  }) : super(key: key);

  final ScrollController? controller;
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    var listView = ListView(
      controller: controller,
      children: children,
      padding: padding,
    );
    var body = MediaQuery.removePadding(
      context: context,
      child: listView,
      removeBottom: true,
      removeTop: true,
    );
    return body;
  }
}
