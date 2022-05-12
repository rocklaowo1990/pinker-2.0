import 'package:get/get.dart';

class CartoomState {
  final _isLoading = true.obs;
  set isLoading(bool value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;
}
