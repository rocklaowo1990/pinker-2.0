import 'package:get/get.dart';
import 'package:pinker/pages/history/library.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(() => HistoryController());
  }
}
