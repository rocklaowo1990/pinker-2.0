import 'package:get/get.dart';

class HomeState {
  final _opacity = 0.0.obs;
  set opacity(double value) => _opacity.value = value;
  double get opacity => _opacity.value;

  final pageIndexRx = 0.obs;
}
