import 'package:get/get.dart';

class HomeState {
  final _opacity = 0.obs;
  set opacity(int value) => _opacity.value = value;
  int get opacity => _opacity.value;

  final _pageIndex = 0.obs;
  set pageIndex(int value) => _pageIndex.value = value;
  int get pageIndex => _pageIndex.value;
}
