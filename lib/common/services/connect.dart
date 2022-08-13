import 'package:get/get.dart';
import 'package:pinker/common/data/library.dart';

class MyConnect extends GetConnect {
  static MyConnect get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    httpClient.defaultDecoder = (json) => ResourceData.fromJson(json);
    httpClient.baseUrl = 'https://mock.apifox.cn/m1/648476-0-default';
    httpClient.timeout = const Duration(milliseconds: 5000);
  }

  /// 获取首页数据
  Future<ResponseData?> getData({
    required String path,
    required body,
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Function(dynamic)? decoder,
    dynamic Function(double)? uploadProgress,
    Future<void> Function(dynamic)? errorCallBack,
  }) async {
    Response response;
    try {
      response = await post(
        path,
        body,
        contentType: contentType,
        headers: headers,
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress,
      );
      return response.body;
    } on Error catch (err) {
      if (errorCallBack != null) await errorCallBack(err);
      return null;
    }
  }
}
