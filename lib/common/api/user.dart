import 'package:dio/dio.dart';
import 'package:pinker/common/data/library.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/utils/library.dart';

class UserApi {
  static Future<ResponseData?> getUserInfo({
    Future<void> Function(ErrorEntity)? errorCallBack,
  }) async {
    Response? response = await MyHttp().get(
      '/user/getUserInfo',
      errorCallBack: ConfigController.to.errorDaliog,
      options: Options(
        headers: {'token': UserController.to.token},
      ),
    );
    return response != null ? ResponseData.fromJson(response.data) : null;
  }
}
