import 'package:get/get.dart';

class CommunityAldultState {
  final _isLoading = true.obs;
  set isLoading(bool value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;
}
