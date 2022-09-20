import 'package:get/get.dart';
import 'package:pinker/pages/country_code/library.dart';

class CountryCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountryCodeController>(() => CountryCodeController());
  }
}
